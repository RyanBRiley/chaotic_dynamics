#import matplotlib
import math
import numpy as np
from matplotlib.figure import Figure
from matplotlib.axes import Axes
from matplotlib.lines import Line2D
from matplotlib.backends.backend_agg import FigureCanvasAgg

def draw_tree(depth, left_theta, right_theta, left_ratio, right_ratio, img, x_start, x_end, y_start, y_end):
    #print 'x_start: ' + str(x_start)
    #print 'x_end: ' + str(x_end)
    line = Line2D([x_start,x_end], [y_start, y_end])
    img.add_line(line)
    if depth == 1:
        return
    else:
         vector = np.array(((x_end - x_start),(y_end - y_start)))
         #print 'vector: ' + str(vector)
         right_R = right_ratio * np.array(((math.cos(math.radians(right_theta)), -math.sin(math.radians(right_theta))),(math.sin(math.radians(right_theta)), math.cos(math.radians(right_theta)))))
         left_R = left_ratio * np.array(((math.cos(math.radians(-left_theta)), -math.sin(math.radians(-left_theta))),(math.sin(math.radians(-left_theta)), math.cos(math.radians(-left_theta)))))
         new_left_trajectory = np.dot(vector, left_R)
         new_right_trajectory = np.dot(vector, right_R)
         #print 'new_left_trajectory: ' + str(new_left_trajectory)
         '''
         x_distance = y_end - y_start
         y_distance = x_end - x_start
         print 'depth: ' + str(depth)
         print 'x_distance: ' + str(x_distance)
         print 'y_distance: ' + str(y_distance)
         '''
         x_start_next = x_end
         y_start_next = y_end
         draw_tree(depth-1, left_theta, right_theta, left_ratio, right_ratio, img, x_start_next, x_start_next + new_left_trajectory[0], y_start_next, y_start_next + new_left_trajectory[1])
         draw_tree(depth-1, left_theta, right_theta, left_ratio, right_ratio, img, x_start_next, x_start_next + new_right_trajectory[0], y_start_next, y_start_next + new_right_trajectory[1])


fig = Figure(figsize = [8,8])
ax = Axes(fig, [.1,.1,.8,.8])
ax.set_xlim([0.0,5.0])
ax.set_ylim([0.0,5.0])
ax.set_title('Fractal Tree')
ax.set_xlabel('x')
ax.set_ylabel('y')
fig.add_axes(ax)
#depth = int(raw_input('Please enter depth: '))
#ratio = int(raw_input('Please enter ratio: '))
print 'HELLO'
draw_tree(13, 30, 40, .6, .5, ax, 2.5, 2.5, 0.0, 1.0)

canvas = FigureCanvasAgg(fig)
canvas.print_figure("fractal_tree_3.png")
