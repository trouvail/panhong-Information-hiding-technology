from PIL import Image
from numpy import asarray

dog = Image.open('new_dog2.jpeg')

width, height = dog.size

dog_array = asarray(dog)

def arnold(x, y, z):
    xx = (x + y + z) % 255
    yy = (x + 2 * y + 2 * z) % 255
    zz = (x + 2 * y + 3 * z) % 255
    return [xx, yy, zz]

for i in range(0, width):
    for j in range(0, height):
        x = dog_array[i][j]
        [a, b, c] = arnold(x[0], x[1], x[2])
        dog_array[i][j] = [a, b, c]

new_dog = Image.fromarray(dog_array)

new_dog.save('new_dog.jpeg')