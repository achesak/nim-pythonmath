# Nim module to provide an interface as similar as possible to Python's
# math module in the standard library.

# Intended use: Import this module, replace any instance of "math." in your
# Python code with "pythonmath.", and it should function the same.

# IMPORTANT NOTE: This is not an exact replacement and may contain inaccuracies
# in some functions. This module is intended only as tool to assist in porting.


# Written by Adam Chesak.
# Released under the MIT open source license.


import math


type
    PythonMathError* = object of Exception


const pi* : float64 = math.PI
const e* : float64 = math.E


proc ceil*(x : float): float = 
    ## Returns the ceiling of ``x`` as a float, the smallest integer value greater than or equal to ``x``.
    
    return math.ceil(x)


proc ceil*(x : int): float = 
    ## Returns the ceiling of ``x`` as a float, the smallest integer value greater than or equal to ``x``.
    
    return float(x)


proc copysign*(x : float, y : float): float = 
    ## Returns ``x`` with the sign of ``y``.
    
    if y == 0 or x == 0:
        return x
    
    elif y > 0:
        if x < 0:
            return -x
        else:
            return x
    
    elif y < 0:
        if x > 0:
            return -x
        else:
            return x


proc copysign*(x : int, y : int): int = 
    ## Returns ``x`` with the sign of ``y``.
    
    if y == 0 or x == 0:
        return x
    
    elif y > 0:
        if x < 0:
            return -x
        else:
            return x
    
    elif y < 0:
        if x > 0:
            return -x
        else:
            return x


proc fabs*(x : float): float = 
    ## Returns the absolute value of ``x``.
    
    return abs(x)


proc fabs*(x : int): float = 
    ## Returns the absolute value of ``x``.
    
    return float(abs(x))


proc factorial*(x : int): int = 
    ## Returns ``x`` factorial.
    
    return math.fac(x)


proc floor*(x : float): float = 
    ## Returns the floor of ``x`` as a float, the largest integer value less than or equal to ``x``.
    
    return math.floor(x)


proc floor*(x : int): float = 
    ## Returns the floor of ``x`` as a float, the largest integer value less than or equal to ``x``.
    
    return float(x)


proc fmod*(x : float, y : float): float = 
    ## Returns the remainder of ``x`` divided by ``y``.
    
    return math.fmod(x, y)


proc frexp*(x : float): seq[float] = 
    ## Returns the mantissa and exponent of ``x`` as the sequence ``(m, e)``.
    
    var e : int
    var m : float = math.frexp(x, e)
    return @[m, float(e)]


proc fsum*(x : openarray[float]): float =
    ## DUMMY FUNCTION (for the moment...)
    
    return 0.0


proc isinf*(x : float): bool = 
    ## Checks if the float ``x`` is positive or negative infinity.
    
    return math.classify(x) == math.FloatClass.fcInf or math.classify(x) == math.FloatClass.fcNegInf


proc isnan*(x : float): bool = 
    ## Checks if the float ``x`` is a NaN (not a number).
    
    return math.classify(x) == math.FloatClass.fcNan


proc ldexp*(x : float, i : float): float = 
    ## Returns ``x * (2**i)``. This is essentially the inverse of function ``frexp()``.
    
    return x * math.pow(2.0, i)


proc modf*(x : float): seq[float] = 
    ## Returns the fractional and integer parts of ``x``. Both results carry the sign of ``x`` and are floats.
    
    if x == 0:
        return @[0.0, 0.0]
    
    var i : float
    if x > 0:
        i = math.floor(x)
    elif x < 0:
        i = math.ceil(x)
    
    var f : float = x - i
    return @[f, i]


proc trunc*(x : float): int = 
    ## Returns the value ``x`` truncated to an int.
    
    if x > 0:
        return int(math.floor(x))
    else:
        return int(math.ceil(x))


proc trunc*(x : int): int = 
    ## Returns the value ``x`` truncated to an int.
    
    return x      # Just in case...


proc exp*(x : float): float = 
    ## Returns ``e**x``.
    
    return math.exp(x)


proc exp*(x : int): float = 
    ## Returns ``e**x``.
    
    return math.exp(float(x))


proc expm1*(x : float): float = 
    ## Returns ``e**x - 1``.
    
    return exp(x) - 1


proc expm1*(x : int): float = 
    ## Returns ``e**x - 1``.
    
    return exp(x) - 1


proc log*(x : float): float = 
    ## Returns natural logarithm of ``x``.
    
    return math.ln(x)


proc log*(x : int): float = 
    ## Returns natural logarithm of ``x``.
    
    return math.ln(float(x))


proc log*(x : float, base : float): float = 
    ## Returns the logarithm of ``x`` to the specified ``base``.
    
    return log(x) / log(base)


proc log*(x : int, base : int): float = 
    ## Returns the logarithm of ``x`` to the specified ``base``.
    
    return log(x) / log(base)


proc log1p*(x : float): float = 
    ## Returns the natural logarithm of ``1+x``.
    
    return log(1 + x) ## TODO: not as accurate as Python


proc log1p*(x : int): float = 
    ## Returns the natural logarithm of ``1+x``.
    
    return log(1 + x) ## TODO: not as accurate as Python


proc log10*(x : float): float = 
    ## Returns the base-10 logarithm of ``x``.
    
    return math.log10(x)


proc log10*(x : int): float = 
    ## Returns the base-10 logarithm of ``x``.
    
    return math.log10(float(x))


proc pow*(x : float, y : float): float = 
    ## Returns ``x`` raised to the ``y`` power.
    
    return math.pow(x, y)


proc pow*(x : int, y : int): float = 
    ## Returns ``x`` raised to the ``y`` power.
    
    return math.pow(float(x), float(y))


proc acos*(x : float): float = 
    ## Returns the arc cosine of ``x``, in radians.
    
    return math.arccos(x)


proc acos*(x : int): float = 
    ## Returns the arc cosine of ``x``, in radians.
    
    return math.arccos(float(x))


proc asin*(x : float): float = 
    ## Returns the arc sine of ``x``, in radians.
    
    return math.arcsin(x)


proc asin*(x : int): float = 
    ## Returns the arc sine of ``x``, in radians.
    
    return math.arcsin(float(x))


proc atan*(x : float): float = 
    ## Returns the arc tangent of ``x``, in radians.
    
    return math.arctan(x)


proc atan*(x : int): float = 
    ## Returns the arc tangent of ``x``, in radians.
    
    return math.arctan(float(x))


proc atan2*(y : float, x : float): float = 
    ## Returns ``atan(y / x)``, in radians.
    
    return math.arctan2(y, x)


proc atan2*(y : int, x : int): float = 
    ## Returns ``atan(y / x)``, in radians.
    
    return math.arctan2(float(y), float(x))


proc cos*(x : float): float = 
    ## Returns the cosine of ``x`` radians.
    
    return math.cos(x)


proc cos*(x : int): float = 
    ## Returns the cosine of ``x`` radians.
    
    return math.cos(float(x))


proc sin*(x : float): float = 
    ## Returns the sine of ``x`` radians.
    
    return math.sin(x)


proc sin*(x : int): float = 
    ## Returns the sine of ``x`` radians.
    
    return math.sin(float(x))


proc tan*(x : float): float = 
    ## Returns the tangent of ``x`` radians.
    
    return math.cos(x)


proc tan*(x : int): float = 
    ## Returns the tangent of ``x`` radians.
    
    return math.cos(float(x))


proc hypot*(x : float, y : float): float = 
    ## Returns the Euclidean norm, ``sqrt(x*x + y*y)``. This is the length of the vector from the origin to point ``(x, y)``.
    
    return math.hypot(x, y)


proc hypot*(x : int, y : int): float = 
    ## Returns the Euclidean norm, ``sqrt(x*x + y*y)``. This is the length of the vector from the origin to point ``(x, y)``.
    
    return math.hypot(float(x), float(y))


proc degrees*(x : float): float = 
    ## Converts angle ``x`` from radians to degrees.
    
    return x * (math.PI / 180)


proc degrees*(x : int): float = 
    ## Converts angle ``x`` from radians to degrees.
    
    return float(x) * (math.PI / 180)


proc radians*(x : float): float = 
    ## Converts angle ``x`` from degrees to radians.
    
    return x * (180 / math.PI)


proc radians*(x : int): float = 
    ## Converts angle ``x`` from degrees to radians.
    
    return float(x) * (180 / math.PI)


proc cosh*(x : float): float = 
    ## Returns the hyperbolic cosine of ``x``.
    
    return math.cosh(x)


proc cosh*(x : int): float = 
    ## Returns the hyperbolic cosine of ``x``.
    
    return math.cosh(float(x))


proc sinh*(x : float): float = 
    ## Returns the hyperbolic sine of ``x``.
    
    return math.sinh(x)


proc sinh*(x : int): float = 
    ## Returns the hyperbolic sine of ``x``.
    
    return math.sinh(float(x))


proc tanh*(x : float): float = 
    ## Returns the hyperbolic tangent of ``x``.
    
    return math.tanh(x)


proc tanh*(x : int): float = 
    ## Returns the hyperbolic tangent of ``x``.
    
    return math.tanh(float(x))


proc acosh*(x : float): float = 
    ## Returns the inverse hyperbolic cosine of ``x``.
    
    return log(x + math.sqrt((x * x) - 1))


proc acosh*(x : int): float = 
    ## Returns the inverse hyperbolic cosine of ``x``.
    
    return log(float(x) + math.sqrt((float(x) * float(x)) - 1))


proc asinh*(x : float): float = 
    ## Returns the inverse hyperbolic sine of ``x``.
    
    return log(x + math.sqrt((x * x) + 1))


proc asinh*(x : int): float = 
    ## Returns the inverse hyperbolic sine of ``x``.
    
    return log(float(x) + math.sqrt((float(x) * float(x)) + 1))


proc atanh*(x : float): float = 
    ## Returns the inverse hyperbolic tangent of ``x``.
    
    return 0.5 * log((1 + x) / (1 - x))


proc atanh*(x : int): float = 
    ## Returns the inverse hyperbolic tangent of ``x``.
    
    return 0.5 * log((1 + float(x)) / (1 - float(x)))


proc erf*(x : float): float = 
    ## Returns the error function at ``x``.
    
    return math.erf(x)


proc erf*(x : int): float = 
    ## Returns the error function at ``x``.
    
    return math.erf(float(x))


proc erfc*(x : float): float = 
    ## Returns the complementary error function at ``x``.
    
    return math.erfc(x)


proc erfc*(x : int): float = 
    ## Returns the complementary error function at ``x``.
    
    return math.erfc(float(x))


proc gamma*(x : float): float = 
    ## Returns the Gamma function at ``x``.
    
    return math.tgamma(x)


proc gamma*(x : int): float = 
    ## Returns the Gamma function at ``x``.
    
    return math.tgamma(float(x))


proc lgamma*(x : float): float = 
    ## Returns the natural logarithm of the absolute value of the Gamma function at ``x``.
    
    return abs(math.lgamma(x))


proc lgamma*(x : int): float = 
    ## Returns the natural logarithm of the absolute value of the Gamma function at ``x``.
    
    return abs(math.lgamma(float(x)))
