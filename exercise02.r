require("MMSec")

# Load images
files <- array(c(
	"Canon-EOS-1200D/Image01.jpg",
	"Canon-EOS-1200D/Image02.jpg",
	"Canon-EOS-1200D/Image03.jpg",
	"Canon-EOS-1200D/Image04.jpg",
	"Canon-EOS-1200D/Image05.jpg",
	"Canon-EOS-1200D/Image06.jpg",
	"Canon-EOS-1200D/Image07.jpg",
	"Canon-EOS-1200D/Image08.jpg",
	"Canon-EOS-1200D/Image12.jpg",
	"Canon-EOS-1200D/Image13.jpg",
	"Canon-EOS-1200D/Image14.jpg",
	"Canon-EOS-1200D/Image15.jpg"
	))

# Number of images
N <- dim(files)

# Size of images
image <- load.jpg(files[1])

dim <- dim(image)
height <- dim[1]
width <- dim[2]

# Initialize reference noise
reference <- image

for (x in 1:height) {
	for (y in 1:width) {
		
		reference$red[x,y] <- 0
		reference$green[x,y] <- 0
		reference$blue[x,y] <- 0

	}
}

referenceR <- reference$red
referenceG <- reference$green
referenceB <- reference$blue

# Sensor noise
for (i in 1:N) {

	print(files[i])

	image <- load.jpg(files[i])

	denoiseR <- median.2d(image$red, 3)
	denoiseG <- median.2d(image$green, 3)
	denoiseB <- median.2d(image$blue, 3)

	denoise <- image
	denoise$red <- denoiseR
	denoise$green <- denoiseG
	denoise$blue <- denoiseB

	noise <- diff(image, denoise)

	referenceR <- referenceR + noise$red
	referenceG <- referenceG + noise$green
	referenceB <- referenceB + noise$blue

}

# Reference noise
referenceR <- referenceR / N
referenceG <- referenceG / N
referenceB <- referenceB / N

reference$red <- referenceR
reference$green <- referenceG
reference$blue <- referenceB

# Save reference
save.jpg(reference, "outputs/exercise02-reference.jpg", overwrite=TRUE)
