sqrt(9)
sqrt(c(4, 9, 16))

dap = 23
b0 = -0.068854
b1 = 0.000841
vol = b0 + b1 * dap^2

volume = function(dap, b0 = -0.068854, b1 = 0.000841){
  return(b0 + b1 * dap^2)  
}

volume(15)
volume(15, -0.05, 0.001)

dap = 23
h = 21
fator = 1.75

AS = (dap^2)*pi/40000
vcil = AS * h
vol = vcil / fator