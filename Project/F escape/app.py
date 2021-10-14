from flask import Flask, request, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
import os
from tinydb import TinyDB, Query, where
#import เพิ่มด้วยนะจ๊ะ
from tinydb.operations import add

load_dotenv()

PORT = 3000
DEBUG = True
DB = "DB.json"

db = TinyDB(DB)
app = Flask(__name__)
cors = CORS(app)


@app.route("/")
def hello_world():
    return "Hello, Flask"


@app.route("/path_parameter/<int:id>")  # /blogs/{id}
def pathParameter(id):
    return f"From Path Parameter\nRequest For ID: {id}"


@app.route("/query_parameter")  # /blogs?id=1
def queryParameter():
    return f"From Query Parameter\nRequest For ID: {request.args.get('id')}"


@app.route("/request_body")
def requestBody():
    return f"From Request Body\nRequest For ID: {request.json['id']}"


@app.route("/post_method", methods=['POST'])
def postMethod():
    return f"This Is Post Method"


@app.route("/blogs/all")
def getAllBlogs():
    blogs = db.table('blogs')
    return jsonify(blogs.all())


@app.route("/blogs/header/<string:header>")
def getBlog(header):
    blogs = db.table('blogs')
    blogData = blogs.search(where('header') == header)
    if (len(blogData) == 0):
        return f'Blog "{header}" Not Found', 404
    else:
        return jsonify(blogData[0])


@app.route("/blogs/author/<string:author>")
def getBlogsByAuthor(author):
    blogs = db.table('blogs')
    return jsonify(blogs.search(where('author') == author))


@app.route("/blogs/search")
def searchBlogs():
    blogs = db.table('blogs')
    return jsonify(blogs.search(Query().tags.any([request.args.get('tag')])))


# create blog: require field header, content, author
@app.route("/blogs/create", methods=['POST'])
def createBlog():
    if not request.is_json:
        return "Invalid JSON", 400

    # Basic Validation
    requiredField = [("header", str),
                     ("content", str),
                     ("author", str),
                     ("tags", list)]
    for fieldValue, fieldType in requiredField:
        if fieldValue not in request.json:
            return f"Missing field: {fieldValue}", 400
        elif type(request.json[fieldValue]) != fieldType:
            return f"Invalid field type: {fieldValue} should be {fieldType}", 400
    for tag in request.json["tags"]:
        if type(tag) != str:
            return f"Invalid tag: tag should be string", 400

    blogs = db.table('blogs')
    if blogs.search(Query().header == request.json['header']) != []:
        return f"Can't create blog, blog header already exists.", 409
    else:
        blogs.insert({
            'header': request.json['header'],
            'content': request.json['content'],
            'author': request.json['author'],
            'tags': request.json['tags']
        })
        return f"Create Blog:\nHeader: {request.json['header']}\nContent: {request.json['content']}\nAuthor: {request.json['author']}\nTags: {', '.join(request.json['tags'])}", 201


@app.route("/blogs/update/<string:header>", methods=['PUT'])
def updateBlog(header):
    blogs = db.table('blogs')
    updateBlogID = blogs.update(
        {"content": request.data.decode('utf-8')}, where('header') == header)
    if len(updateBlogID) == 0:
        return f'Blog "{header}" Not Found', 404
    else:
        return f'Blog "{header}" Updated', 200


@app.route("/blogs/delete/<string:header>", methods=['DELETE'])
def deleteBlog(header):
    blogs = db.table('blogs')
    removeBlogID = blogs.remove(where('header') == header)
    if len(removeBlogID) == 0:
        return f'Blog "{header}" Not Found', 404
    else:
        return f'Blog "{header}" Deleted', 200


@app.route("/blogs/<string:header>/tags", methods=['PUT'])
def updateBlogTag(header):
    if not request.is_json:
        return "Invalid JSON", 400
    blogs = db.table('blogs')
    updateBlogID = blogs.update(add("tags", request.json['tags']), where('header') == header)
    if len(updateBlogID) == 0:
        return f'Blog "{header}" Not Found', 404
    else:
        return f'Blog "{header}" Updated', 200


@app.route("/comments/create", methods=['POST'])
def createComment():
    if not request.is_json:
        return "Invalid JSON", 400

    # Basic Validation
    requiredField = [("header", str),
                     ("content", str),
                     ("author", str)]

    for fieldValue, fieldType in requiredField:
        if fieldValue not in request.json:
            return f"Missing field: {fieldValue}", 400
        elif type(request.json[fieldValue]) != fieldType:
            return f"Invalid field type: {fieldValue} should be {fieldType}", 400

    blogs = db.table('blogs')
    if blogs.search(Query().header == request.json['header']) == []:
        return "Not found blog", 404

    comments = db.table('comments')
    commentId = comments.insert({
        'header': request.json['header'],
        'content': request.json['content'],
        'author': request.json['author']
    })
    comment = comments.get(doc_id=commentId)
    comment['id'] = commentId
    return jsonify(comment), 201


@app.route("/comments/all")
def getAllComment():
    comments = db.table('comments')
    return jsonify(comments.all())


@app.route("/blogs/<string:header>/comments/all")
def getAllBlogComment(header):
    comments = db.table('comments')
    return jsonify(comments.search(Query().header == header))


@app.route("/comments/<string:author>/all")
def getAllAuthorComment(author):
    comments = db.table('comments')
    return jsonify(comments.search(Query().author == author))


@app.route("/comments/<int:id>", methods=['PUT'])
def updateComment(id):
    if not request.is_json:
        return "Invalid JSON", 400

    comments = db.table('comments')
    updateCommentID = comments.update({"content": request.json['content']}, doc_ids=[id])
    if len(updateCommentID) == 0:
        return f'Not found comment', 404
    else:
        comment = comments.get(doc_id=id)
        comment['id'] = id
        return jsonify(comment), 200


@app.route("/comments/<int:id>", methods=['DELETE'])
def deleteComment(id):
    comments = db.table('comments')
    removeCommentID = comments.remove(doc_ids=[id])
    if len(removeCommentID) == 0:
        return f'Not found comment', 404
    else:
        return f'Successfully deleted', 200


if __name__ == "__main__":
    app.run(port=PORT, debug=DEBUG)
