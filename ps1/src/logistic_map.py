############################################
#		CSCI 4446 - Chaotic Dynamics       #
#		Problem Set 1                      #
#		Ryan Riley						   #
#		20 January 2017					   #
############################################

from matplotlib import pyplot as plt

def logistic_map(x0, r, m):
	data = [x0]
	for n in xrange(m):
		xn = data[n]
		data.append(r * xn * (1 - xn))
	return data

if __name__ == "__main__":
	
	#plot 00
	x0 = 0.2
	r = 3.43
	m = 50
	x = range(m+1)
	y = logistic_map(x0, r, m)
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.title(title)
	plt.show()

	#plot 0
	x0 = 0.2
	r = 2.6
	m = 50
	x = range(m+1)
	y = logistic_map(x0, r, m)
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.title(title)
	plt.show()

	#plot 1
	x0 = 0.2
	r = 3.83
	m = 50
	x = range(m+1)
	y = logistic_map(x0, r, m)
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.title(title)
	plt.show()

	#plot 2
	x = logistic_map(x0, r, m)
	y = x[1:]
	x.pop()
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn+1')
	plt.xlabel('xn')
	plt.title(title)
	plt.show()

	#plot 3
	x = logistic_map(x0, r, m)
	y = x[2:]
	x.pop()
	x.pop()
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn+2')
	plt.xlabel('xn')
	plt.title(title)
	plt.show()

	#plot r > 4
	x0 = 0.2
	r = 4.5
	m = 50
	x = range(m+1)
	y = logistic_map(x0, r, m)
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	print title
	print 'x: '
	print x
	print 'y: '
	print y
	plt.scatter(x, y)
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.title(title)
	plt.show()


	#plot chaos 1
	x0 = 0.2
	r = 4.0
	m = 50
	x = range(m+1)
	y1 = logistic_map(x0, r, m)
	x0 = 0.200001
	y2 = logistic_map(x0, r, m)
	title = 'Logistic Map demonstating chaos with ' + str(m) + ' iterates , R = ' + str(r) 
	plt.scatter(x, y1, color = 'k', label = 'x0 = 0.2')
	plt.scatter(x, y2, color = 'y', label = ' x0 = 0.200001')
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.legend()
	plt.title(title)
	plt.show()

	#plot chaos 2
	x0 = 0.2
	r = 3.99
	m = 50
	x = range(m+1)
	y1 = logistic_map(x0, r, m)
	x0 = 0.200001
	y2 = logistic_map(x0, r, m)
	title = 'Logistic Map demonstating chaos with ' + str(m) + ' iterates , R = ' + str(r) 
	plt.scatter(x, y1, color = 'k', label = 'x0 = 0.2')
	plt.scatter(x, y2, color = 'y', label = ' x0 = 0.200001')
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.legend()
	plt.title(title)
	plt.show()

	#plot r = 2.5
	x0 = 0.2
	r = 2.5
	m = 50
	x = range(m+1)
	y = logistic_map(x0, r, m)
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.title(title)
	plt.show()

	x0 = 0.55
	x = range(m+1)
	y = logistic_map(x0, r, m)
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.title(title)
	plt.show()

	x0 = 0.76
	x = range(m+1)
	y = logistic_map(x0, r, m)
	title = 'Logistic Map with ' + str(m) + ' iterates, initial condition = ' + str(x0) + ', R = ' + str(r) 
	plt.scatter(x, y)
	plt.ylabel('xn')
	plt.xlabel('n')
	plt.title(title)
	plt.show()