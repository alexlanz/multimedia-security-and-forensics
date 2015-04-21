require("MMSec")

img1 <- load.png("data/Img7.png")

m = 256 * as.matrix.greymap(img1)
h = hist(m, breaks=256, plot=FALSE)

x = 0

for (i in 0:127) {
	value1 = 0
	value2 = 0

	for (j in 1:length(h$breaks)) {

		if (h$breaks[j] == (2*i)) {
			value1 = h$counts[j]
		}

		if (h$breaks[j] == (2*i+1)) {
			value2 = h$counts[j]
		}
		
	}

	e = (value1 + value2)/2

	if (e == 0) {
		next
	}

	x = x + ((value2 - e)^2 / e)
}

print(x)


