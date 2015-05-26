require("MMSec")

# Load image
image <- load.png("images/2.png")
image <- as.matrix(image) * 255

# p-map
coefficient <- array(c(-0.25, 0.5, -0.25, 0.5, 0, 0.5, -0.25, 0.5, -0.25), c(3, 3))

filtered <- lin.filter.2d(image, coefficient=coefficient)
subtracted <- image - filtered
pmap <- dnorm(subtracted)

save.png(greymap(pmap), "outputs/exercise01.png", overwrite=TRUE)
