# BD: Guião 7


## ​7.2 
 
### *a)*

```
... Write here your answer ...
A relação está em 1FN, pois os atributos são atómicos e não suporta relações dentro de relações. Não está em 2FN, porque não há dependências funcionais parciais. E não está em 3FN, porque há dependências transitivas.




It is possible to <u>underline</u> -> {A, B,.. }
-> R1 (_A_, B, C)
-> R2 (B,F)

```

### *b)* 

```
... Write here your answer ...
1FN → 2FN

Eliminar dependências parciais:

Nome_Autor → Afiliacao_Autor

Criar nova relação:

Autor(Nome_Autor, Afiliacao_Autor)

Remover Afiliacao_Autor da relação principal:

Livro(Titulo_Livro, Nome_Autor, Tipo_Livro, Preco, NoPaginas, Editor, Endereco_Editor, Ano_Publicacao)

2FN → 3FN

Eliminar dependências transitivas:

Tipo_Livro, NoPaginas → Preco
Criar: TipoLivroPreco(Tipo_Livro, NoPaginas, Preco)
Remover Preco de Livro.

Editor → Endereco_Editor
Criar: Editora(Editor, Endereco_Editor)
Remover Endereco_Editor de Livro.


Relações finais em 3FN:

Livro(Titulo_Livro, Nome_Autor, Tipo_Livro, NoPaginas, Ano_Publicacao, Editor)

Autor(Nome_Autor, Afiliacao_Autor)

TipoLivroPreco(Tipo_Livro, NoPaginas, Preco)

Editora(Editor, Endereco_Editor)
```




## ​7.3
 
### *a)*

```
... Write here your answer ...
```


### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```


## ​7.4
 
### *a)*

```
... Write here your answer ...
```


### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```



## ​7.5
 
### *a)*

```
... Write here your answer ...
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
