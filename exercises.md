---
layout: page
title: Exercises
description: Course exercises
---

# Exercise 1: Learning a 1D Smoothing Filter via Neural Networks

In this [program](https://github.com/fum-cs/dl/blob/main/code/conv_play.ipynb), we applied a 1×3 filter with values [1/3, 1/3, 1/3] to 490 data points (Chapter 4 dataset). The original signal of 490 elements was smoothed, producing an output of 488 elements due to convolution without padding.

Task:
1. Modify the TensorFlow (Keras) model to produce output with the same size as the input. Initialize the model weights with the 1×3 filter [1/3, 1/3, 1/3].
2. Assume the input (X) and output (y) from the previous model are our training data. Create a new model similar to the first, but do not initialize the weights. During training:
   - Feed X to the model
   - Expect the model to output y
   - Use mean squared error between model output and y as the loss function
3. Display the weights learned by the trained Keras model.

# Exercise 2: Learning a 2D Edge Detection Filter via Neural Networks

In the provided notebook [Large-Scale-Constrained-Linear-Least-Squares](https://github.com/fum-cs/dl-fall-2023/blob/main/code/Large-Scale-Constrained-Linear-Least-Squares.ipynb), we used a filter for horizontal/vertical motion blur, represented as matrix D. By multiplying D with the image, we simulated motion blur. Then, assuming we have D and the blurred image, we approximated the original image by solving an optimization problem.

Task:
1. Similar to the previous 1D exercise, but now for 2D: Learn an edge detection filter.
2. First, implement a classical optimization method to solve Ax=b (or Dx=G), but replace motion blur with horizontal/vertical edge detection (similar to the provided program).
3. Combine these steps:
   a. Apply a known kernel (e.g., Prewitt) to an image using a signal processing library to generate edge maps.
   b. Using a Keras model and given the original image and edge map (output of the known kernel), find a kernel that performs the same edge detection. The number of parameters in the Keras kernel must match the known filter.
   c. During training:
      - Feed the original image to the model
      - Expect the model to output the edge map
4. Display the weights learned by the trained Keras model.
5. Apply the learned weights (as a kernel) using the signal processing library and display:
   - Original image
   - Output of the trained model
   - Initial edge map (from known kernel)
6. Apply the trained model to a different image and display the result.