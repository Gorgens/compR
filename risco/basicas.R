## Fórmulas auxiliares de economia
  

### Valor presente  --------------

vp = function(vn, i, n){
  return(vn / (1 + i)^n)
}

#vp(100, 0.10, 0)
#vp(100, 0.10, 1)
#vp(100, 0.10, 2)
#vp(100, 0.10, 3)

### Valor futuro -----------------

vf = function(v, i, n){
  return(v * (1 + i)^n)
}

#vf(100, 0.10, 0)
#vf(100, 0.10, 1)
#vf(100, 0.10, 2)
#vf(100, 0.10, 3)

### Série Finita  ----------------

serieFinita = function(a, i, n, presente = TRUE, t = NULL){
  if (presente == TRUE){        
    if (is.null(t)){
      return((a*((1+i)^n)-1)/(i*(1+i)^n))
    }else{
      return((a*((1+i)^(n*t)-1))/(((1+i)^t - 1)*(1+i)^(n*t)))
    }
  }else{
    if(t == None){
      return((a*((1+i)^n - 1))/(i))
    }else{
      return(a*(((1+i)^n*t - 1)/((1+i)^t -1)))
    }
  }
}

#serieFinita(100, 0.10, 12)

### Série Infinita  --------------

serieInfinita = function(a, i, t = NULL){
  if(is.null(t)){
    return(a/i)
  }else{
    return(a/((1+i)^t -1))
  }
}


# serieInfinita(800, 0.01)