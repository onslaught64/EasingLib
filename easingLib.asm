/*
Interactive tool for doing this and building custom curves:
http://www.timotheegroleau.com/Flash/experiments/easing_function_generator.htm

Parameters:
t = current time
b = start value
c = change in value (delta)
d = duration total time

Converted to Kick Assembler functions by Zig/Defame
Contact: joe@pixolut.com 

Consider time parameters as 'steps' in the case of building typical datasets

EXAMPLES:
.fill $100,linearTween(i,$00,$80,$100)
fill $100 bytes from values $00 to $80 with linear tweening

.fill $100,easeInOutQuad(i,$80,-$10,$100)
fill $100 bytes with a quadratic tweening between $80 and $70 

I don't take credit for any of the math in this code! 
*/

//simple linear tweening - no easing, no acceleration
.function linearTween(t, b, c, d) {
    .return c*t/d + b
}

// quadratic easing in - accelerating from zero velocity
.function easeInQuad(t, b, c, d) {
    .eval t = t / d
    .return c*t*t + b
}

// quadratic easing out - decelerating to zero velocity
.function easeOutQuad(t, b, c, d) {
    .eval t = t/d
    .return -c * t*(t-2) + b
}


// quadratic easing in/out - acceleration until halfway, then deceleration
.function easeInOutQuad(t, b, c, d) {
    .eval t = t/d/2
    .if (t < 1) 
        .return c/2*t*t + b
    .eval t--
        .return -c/2 * (t*(t-2) - 1) + b
}


// cubic easing in - accelerating from zero velocity
.function easeInCubic(t, b, c, d) {
    .eval t = t/d
    .return c*t*t*t + b
}


// cubic easing out - decelerating to zero velocity
.function easeOutCubic(t, b, c, d) {
    .eval t = t/d
    .eval t--
    .return c*(t*t*t + 1) + b
}


// cubic easing in/out - acceleration until halfway, then deceleration
.function easeInOutCubic(t, b, c, d) {
    .eval t = t/d/2
    .if (t < 1) 
        .return c/2*t*t*t + b
    .eval t -= 2
    .return c/2*(t*t*t + 2) + b
}

// quartic easing in - accelerating from zero velocity
.function easeInQuart(t, b, c, d) {
    .eval t = t/d
    .return c*t*t*t*t + b
}


// quartic easing out - decelerating to zero velocity
.function easeOutQuart(t, b, c, d) {
    .eval t = t/d
    .eval t--
    .return -c * (t*t*t*t - 1) + b
}


// quartic easing in/out - acceleration until halfway, then deceleration
.function easeInOutQuart(t, b, c, d) {
    .eval t = t/d/2
    .if (t < 1) 
        .return c/2*t*t*t*t + b
    .eval t -= 2
    .return -c/2 * (t*t*t*t - 2) + b
}


// quintic easing in - accelerating from zero velocity
.function easeInQuint(t, b, c, d) {
    .eval t = t/d
    .return c*t*t*t*t*t + b
}


// quintic easing out - decelerating to zero velocity
.function easeOutQuint(t, b, c, d) {
    .eval t = t/d
    .eval t--
    .return c*(t*t*t*t*t + 1) + b
}


// quintic easing in/out - acceleration until halfway, then deceleration
.function easeInOutQuint(t, b, c, d) {
    .eval t = t/d/2
    .if (t < 1) 
        .return c/2*t*t*t*t*t + b
    .eval t -= 2
    .return c/2*(t*t*t*t*t + 2) + b
}

// sinusoidal easing in - accelerating from zero velocity
.function easeInSine(t, b, c, d) {
    .return -c * cos(t/d * (PI/2)) + c + b
}


// sinusoidal easing out - decelerating to zero velocity
.function easeOutSine(t, b, c, d) {
    .return c * sin(t/d * (PI/2)) + b
}


// sinusoidal easing in/out - accelerating until halfway, then decelerating
.function easeInOutSine(t, b, c, d) {
    .return -c/2 * (cos(PI*t/d) - 1) + b
}


// exponential easing in - accelerating from zero velocity
.function easeInExpo(t, b, c, d) {
    .return c * pow( 2, 10 * (t/d - 1) ) + b
}


// exponential easing out - decelerating to zero velocity
.function easeOutExpo(t, b, c, d) {
    .return c * ( -(pow( 2, -10 * t/d )) + 1 ) + b
}


// exponential easing in/out - accelerating until halfway, then decelerating
.function easeInOutExpo(t, b, c, d) {
    .eval t = t/d/2
    .if (t < 1) 
        .return c/2 * pow( 2, 10 * (t - 1) ) + b
    .eval t--
    .return c/2 * ( -(pow( 2, -10 * t)) + 2 ) + b
}

// circular easing in - accelerating from zero velocity
.function easeInCirc(t, b, c, d) {
    .eval t = t/d
    .return -c * (sqrt(1 - t*t) - 1) + b
}


// circular easing out - decelerating to zero velocity
.function easeOutCirc(t, b, c, d) {
    .eval t = t/d
    .eval t--
    .return c * sqrt(1 - t*t) + b
}


// circular easing in/out - acceleration until halfway, then deceleration
.function easeInOutCirc(t, b, c, d) {
    .eval t = t/d/2
    .if (t < 1) 
        .return -c/2 * (sqrt(1 - t*t) - 1) + b
    .eval t -= 2
    .return c/2 * (sqrt(1 - t*t) + 1) + b
}
