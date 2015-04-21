require("MMSec")

img1 <- load.png("data/Img8.png")
m = 255 * as.matrix.greymap(img1)

# Histogram
png(filename="outputs/Img8.png")
h = hist(m, breaks=256)
dev.off()

# Color frequency
frequency = matrix(0, 256)

for (i in 1:ncol(m)) {
	for (j in 1:nrow(m)) {
		color = m[i,j] + 1
		frequency[color] <- frequency[color] + 1
	}
}

# X²
x = 0

for (i in 0:127) {
	# Calculate X²
	y1 = frequency[2*i+1]
	y2 = frequency[2*i+2]

	e = (y1 + y2)/2

	if (e == 0) {
		next
	}

	x = x + ((y2 - e)^2 / e)
}

print(x)


