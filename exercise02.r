require("MMSec")

# Load image
image <- load.png("images/1.png")
image <- as.matrix(image) * 255

# p-map
coefficient <- array(c(-0.25, 0.5, -0.25, 0.5, 0, 0.5, -0.25, 0.5, -0.25), c(3, 3))

filtered <- lin.filter.2d(image, coefficient=coefficient)
subtracted <- image - filtered
pmap <- dnorm(subtracted)

save.png(greymap(pmap), "outputs/exercise02-pmap.png", overwrite=TRUE)

# Zero mean
dim <- dim(pmap)
height <- dim[1]
width <- dim[2]

for (x in 1:height) {
	for (y in 1:width) {
		
		

	}
}

mean <- mean(pmap)
zero <- pmap - mean

# Frequency domain
frequency <- fft(zero)

png(filename="outputs/exercise02-frequency.png")
plot(frequency, xlim=c(-5, 5), ylim=c(-5, 5))
dev.off()

density <- density(subtracted)
print(density)

png(filename="outputs/exercise02-density.png")
plot(density)
dev.off()
