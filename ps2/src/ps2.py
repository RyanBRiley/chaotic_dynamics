############################################
#		CSCI 4446 - Chaotic Dynamics       #
#		Problem Set 2                      #
#		Ryan Riley						   #
#		29 January 2017					   #
############################################

from matplotlib import pyplot as plt
import numpy

def logistic_map(x0, r, m, l):
	data = [x0]
	for n in xrange(m):
		xn = data[n]
		data.append(r * xn * (1 - xn))
	return data[l:]

def henon_map(x0, a, m, l):
	xk = [x0]
	yk = [0]
	b = 0.3
	for k in xrange(m):
		xk.append(yk[k] + 1 - (a*(xk[k]**2)))
		yk.append(b*xk[k])
	return xk[l:]

def value_lookup(val_dict):
	while(1):
		x_val = raw_input("Please enter a value to lookup or type exit to print plot: ")
		if x_val == 'exit':
			return
		elif val_dict.has_key(x_val):
			print 'values at: ' + x_val + ': ' + str(val_dict[x_val])
		else:
			print("value not found")

def bifurcation_plot(x0, m, l, interval):
	results = []
	val_dict = {}
	r_vals = numpy.arange(2.8, 4.0, interval)
	for r in r_vals:
		points = logistic_map(x0, r, m, l)
		results.append(points)
		val_dict[str(r)] = points
	for r, result in zip(r_vals, results):
		for xn in result:
			plt.scatter(r, xn,s=0.2 , c='black')
				
	plt.figure(1)
	plt.ylabel('xn')
	plt.xlabel('r')
	plt.title('Bifurcation plot')
	plt.savefig('Bifurcation_plot.png', dpi = 200)
	value_lookup(val_dict)
	plt.show(1)

def henon_bifurcation_plot(x0, m, l, interval):
	results = []
	a_vals = numpy.arange(0, 1.4, interval)
	for a in a_vals:
		results.append(henon_map(x0, a, m, l))
	for a, result in zip(a_vals, results):
		for xn in result:
			plt.scatter(a, xn,s=0.2 , c='black')

	plt.figure(1)
	plt.ylabel('xn')
	plt.xlabel('a')
	plt.title('Henon Map Bifurcation plot')
	plt.savefig('Henon_plot.png', dpi = 200)
	plt.show(1)

	'''
	print 'len of results[0]: ' + str(len(results[0]))
	print 'len of r_vals: ' + str(len(r_vals))
	print 'r_vals: ' + str(r_vals)
	print 'results: ' + str(results)
	''' 
	return

if __name__ == "__main__":
	#henon_bifurcation_plot(0.2, 300, 100, .005)
	
	x0 = float(raw_input("Please enter x0: "))
	m = int(raw_input("Please enter the number of iterates, m: "))
	l = int(raw_input("Please enter the number of suppressed transient iterates, l: "))
	interval = float(raw_input("Please enter the interval between R values: "))
	bifurcation_plot(x0, m, l, interval)
	

	
	#plot 00
	'''
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
	'''