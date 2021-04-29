import matplotlib.pyplot as plt
import numpy as np
import cv2
from skimage import measure
from google.colab import files


def mse(imageA, imageB):
	# NOTE: the two images must have the same dimension
	err = np.sum((imageA.astype("float") - imageB.astype("float")) ** 2)
	err /= float(imageA.shape[0] * imageA.shape[1])
	return err

def ssim_compare(imageA, imageB):
    s = measure.compare_ssim(imageA, imageB)
    return s

def compare_images(imageA, imageB, title):
  s = ssim_compare(imageA, imageB)
  m = mse(imageA, imageB)
  fig = plt.figure(title)
  plt.suptitle("MSE: %.2f, SSIM: %.2f" % (m, s))
  ax = fig.add_subplot(1, 2, 1)
  plt.imshow(imageA, cmap = plt.cm.gray)
  ax = fig.add_subplot(1, 2, 2)
  plt.imshow(imageB, cmap = plt.cm.gray)
  plt.axis("off")
  plt.show()
 
uploaded = files.upload()
original1 = cv2.imread("smiley1.jpg")
original2 = cv2.imread("smiley1.jpg")
captured1 = cv2.imread("smiley.jpg")
captured2 = cv2.imread("smiley.jpg")

# convert the images to grayscale
original1 = cv2.cvtColor(original1, cv2.COLOR_BGR2GRAY)
original2 = cv2.cvtColor(original2, cv2.COLOR_BGR2GRAY)
captured1 = cv2.cvtColor(captured1, cv2.COLOR_BGR2GRAY)
captured2 = cv2.cvtColor(captured2, cv2.COLOR_BGR2GRAY)

# initialize the figure
fig = plt.figure("Images")
images = ("original1", original1), ("captured1", captured1), ("original2", original1), ("captured2", captured1)
# loop over the images
for (i, (name, image)) in enumerate(images):
	# show the image
	ax = fig.add_subplot(2, 2, i + 1)
	ax.set_title(name)
	plt.imshow(image, cmap = plt.cm.gray)
	plt.axis("off")
# show the figure
plt.show()
# compare the images
compare_images(original1, original1, "Original vs. Original")
compare_images(original1, captured1, "Original vs. Captured")

