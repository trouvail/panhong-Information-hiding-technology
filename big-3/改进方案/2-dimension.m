from PIL import ImageColor
from PIL import Image
import random

dog = Image.open('1.jpeg')

width, height = dog.size

dog_updown = dog.copy()
key_updown = []

for i in range(width):
    x = random.randint(0, height)
    key_updown.append(x)
    for j in range(height):
        pix = dog.getpixel((i, j))
        dog_updown.putpixel((i, (j + x) % width), pix)

dog_updown.save('2.jpeg')

dog_leftright = dog_updown.copy()
key_leftright = []

for j in range(height):
    x = random.randint(0, width)
    key_leftright.append(x)
    for i in range(height):
        pix = dog_updown.getpixel((i, j))
        dog_leftright.putpixel(((i + x) % width, j), pix)

dog_leftright.save('3.jpeg')

for j in range(height):
    x = key_leftright[j]
    key_leftright.append(x)
    for i in range(height):
        pix = dog_leftright.getpixel((i, j))
        dog_updown.putpixel(((i - x + width) % width, j), pix)


for i in range(width):
    x = key_updown[i]
    for j in range(height):
        pix = dog_updown.getpixel((i, j))
        dog.putpixel((i, (j - x + height) % width), pix)

dog.save('1.jpeg')