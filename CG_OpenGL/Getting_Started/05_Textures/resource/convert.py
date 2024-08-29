from PIL import Image
import argparse

def convert_image_for_opengl(input_path, output_path, is_flip=False):
    """
    Converts an image to a format suitable for OpenGL by flipping it vertically,
    converting it to RGBA, and saving it as a PNG file.
    
    :param input_path: Path to the input image file.
    :param output_path: Path where the converted image will be saved.
    :param is_flip: Whether to flip the image vertically (default: False).
    """
    try:
        # Open the image file
        with Image.open(input_path) as img:
            print(f"Opened image: {input_path}")
            
            # Display original image details
            print(f"Original image mode: {img.mode}")
            print(f"Original image size: {img.size}")
            
            # Flip the image vertically
            if is_flip:
                img_flipped = img.transpose(Image.FLIP_TOP_BOTTOM)
                print("Image flipped vertically.")
            else:
                img_flipped = img
            
            # Convert the image to RGBA format
            img_rgba = img_flipped.convert("RGBA")
            print("Image converted to RGBA format.")
            
            # Save the converted image as PNG
            img_rgba.save(output_path, format='PNG')
            print(f"Converted image saved to: {output_path}")
    
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage:
if __name__ == "__main__":
    # input_image_path = "path/to/your/input_image.jpg"      # Replace with your image path
    # output_image_path = "path/to/save/image_converted.png"  # Replace with desired save path
    parser = argparse.ArgumentParser(description='Convert image for OpenGL')
    parser.add_argument('input_image_path', type=str, help='Path to the input image file')
    parser.add_argument('output_image_path', type=str, help='Path to save the converted image file')
    # --flip to flip the image vertically
    parser.add_argument('--flip', action='store_true', help='Flip the image vertically')
    args = parser.parse_args()
    input_image_path = args.input_image_path
    output_image_path = args.output_image_path
    is_flip = args.flip
    
    convert_image_for_opengl(input_image_path, output_image_path, is_flip)