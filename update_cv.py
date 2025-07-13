from PIL import Image
import subprocess
import os


def main():

    RENDERCV = ".venv/bin/rendercv"

    subprocess.run(
        [RENDERCV, "render", "gabriel_CV.yaml", "--output-folder-name", "doc"]
    )
    subprocess.run(
        [RENDERCV, "render", "gabriel_CV_PC.yaml", "--output-folder-name", "pc"]
    )
    subprocess.run(
        [RENDERCV, "render", "gabriel_CV_mobile.yaml", "--output-folder-name", "mobile"]
    )

    formats = ["pc", "mobile"]

    for format in formats:

        for file in os.listdir(format):
            if file.endswith(".png"):

                IMAGE_RELATIVE_PATH = f"{format}/{file}"

                img = Image.open(IMAGE_RELATIVE_PATH)
                img = img.crop((1400, 200, 3600, 6800))
                img.save(IMAGE_RELATIVE_PATH)


if __name__ == "__main__":
    main()
