# Calculate MLE of sclae parameter of Weibull distribution using Newton's method.
# the p.d.f of Weibull distribution is f(x) = (alpha / beta) * (x / beta) ** (alpha - 1) * exp(-(x / beta) ** alpha)
import numpy as np


# Define the shape and scale parameters of the Weibull distribution
shape = 2.5
scale = 1.0
size = 100000
# Generate a random sample of size 100 from the Weibull distribution
sample = np.random.weibull(shape, size=size) * scale

# theoratical value of the MLE
m = (np.sum(sample**shape) / size) ** (1 / shape)


def func(x, theta):
    suma = np.sum(x**shape)
    return (size * theta ** (shape + 1) - theta * suma) / (
        size * theta**shape - (shape + 1) * suma
    )


theta = 0.5


def Newtons(fun, x, theta, ep=1e-5, it_max=100):
    index = 0
    k = 1
    while k <= it_max:
        theta1 = theta
        obj = fun(x, theta)
        theta = theta + func(x, theta)
        print("第", k, "次迭代的alpha值为", theta)
        norm = np.sqrt(np.sum((theta - theta1) ** 2))
        if norm < ep:
            index = 1
            break
        k = k + 1
    obj = fun(x, theta)
    print("alpha估计值为", theta)


print("参数MLE的解析值为", m)
print("参数理论值为", scale)
Newtons(func, sample, theta)
