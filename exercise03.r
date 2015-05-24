require("MMSec")

# Load images
image <- load.jpg("Canon-EOS-1200D/Image13.jpg")
reference <- load.jpg("outputs/exercise02-reference.jpg")

# Size of images
dim <- dim(reference)
height <- dim[1]
width <- dim[2]

# Sensor noise
denoiseR <- median.2d(image$red, 3)
denoiseG <- median.2d(image$green, 3)
denoiseB <- median.2d(image$blue, 3)

denoise <- image
denoise$red <- denoiseR
denoise$green <- denoiseG
denoise$blue <- denoiseB

noise <- diff(image, denoise)

# Pearson correlation coefficient
corR <- cor.test(reference$red, noise$red, method="pearson")
corG <- cor.test(reference$green, noise$green, method="pearson")
corB <- cor.test(reference$blue, noise$blue, method="pearson")

cor <- (corR$estimate + corG$estimate + corB$estimate) / 3
print(cor)
