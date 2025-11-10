# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Pname, Ssn, Fname, Lname ((employee ⨝ (ρ Ssn←Essn (works_on)) ⨝ Pno = Pnumber project))
```


### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
... Write here your answer ...
```


### *e)* 

```
... Write here your answer ...
```


### *f)* 

```
... Write here your answer ...
```


### *g)* 

```
... Write here your answer ...
```


### *h)* 

```
... Write here your answer ...
```


### *i)* 

```
... Write here your answer ...
```


## ​Problema 5.2

### *a)*

```
π nif, nome (fornecedor) - π fornecedor, nome (fornecedor ⨝ encomenda)
```

### *b)* 

```
γ codProd; media_unidades <- avg(unidades) (item)
```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
π nif, nome, codProd, unidades (fornecedor ⨝ encomenda ⨝ item)

```


## ​Problema 5.3

### *a)*

```
... Write here your answer ...
```

### *b)* 

```
γ especialidade; numprescricoes <- count(numPresc) (medico ⨝ prescricao)

```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
π nome (farmaco)-π nomeFarmaco (presc_farmaco ⨝ prescricao ⨝ farmaco)
```

### *e)* 

```
... Write here your answer ...
```

### *f)* 

```
... Write here your answer ...
```
