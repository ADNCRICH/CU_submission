import openl3
import soundfile as sf
import os

# audio, sf = sf.read("/source/ML_CarWow.mp3")
# openl3.process_audio_file('D:\AD\CU_submission\ML\Summer#2023\source\ML_CarWow.mp3',
#                           suffix="test3", output_dir='D:\AD\CU_submission\ML\Summer#2023\output')

# a = [2, 9, 46, 47, 54, 81, 87, 97]
# l = []
# for i in a:
#     s = "\madrs"+str(i).zfill(3)+".wav"
#     l.append("D:\AD\CU_submission\ML\Summer#2023\source\ADReSS-M-sample-gr\sample-gr"+s)

# openl3.process_audio_file(l, suffix="out", output_dir="D:\AD\CU_submission\ML\Summer#2023\output\sample-gr_out", batch_size=32)

# openl3.process_audio_file("D:\AD\CU_submission\ML\Summer#2023\source\ADReSS-M-sample-gr\sample-gr\madrs002.wav")

# input_repr, content_type, embedding_size = 'mel128', 'music', 6144
# model_kapre = openl3.models.load_audio_embedding_model(input_repr, content_type, embedding_size)

# # openl3.process_audio_file('D:\AD\CU_submission\ML\Summer#2023\source\ML_CarWow.mp3',
# #                           suffix="test2", output_dir='D:\AD\CU_submission\ML\Summer#2023\output', model=model_kapre)

# # use openl3 to extract audio features and predict if cat or dog
# openl3.predict_audio_file('D:\AD\CU_submission\ML\Summer#2023\source\ML_CarWow.mp3',
#                           suffix="test3", output_dir='D:\AD\CU_submission\ML\Summer#2023\output', model=model_kapre)

l = []
directory = r"D:\AD\CU_submission\ML\Summer#2023\source\trainSet"
outDir = r"D:\AD\CU_submission\ML\Summer#2023\output\trainSet_out"
directory = directory.replace("\\", "\\\\")
outDir = outDir.replace("\\", "\\\\")
for i in os.listdir(directory):
    l.append(os.path.join(directory, i))
openl3.process_audio_file(l, suffix="out", output_dir=outDir, batch_size=32)
