require("MMSec")

# Load image
#image <- load.png("data/Img1.png")
#image <- as.matrix(image) * 255

#data(frauenkirche)
#image <- frauenkirche

data(lena)
image <- lena

# Size of image
dim <- dim(image)
height <- dim[1]
width <- dim[2]

# Sensor noise
denoise <- median.2d(image, 3)
noise <- image - denoise

for (x in 1:height) {
	for (y in 1:width) {
		
		if (noise[x,y] < 0)
		{
			noise[x,y] = noise[x,y] * (-1)
		}

		noise[x,y] = 255 - noise[x,y]
	}
}

# Save image
save.png(greymap(image), "outputs/exercise01-original.png", overwrite=TRUE)
save.png(greymap(noise), "outputs/exercise01-noise.png", overwrite=TRUE)
