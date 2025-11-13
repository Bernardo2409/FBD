# BD: Guião 7


## ​7.2 
 
### *a)*

```
A relação está em 1FN, pois os atributos são atómicos e não suporta relações dentro de relações. Não está em 2FN, porque não há dependências funcionais parciais. E não está em 3FN, porque há dependências transitivas.




It is possible to <u>underline</u> -> {A, B,.. }
-> R1 (_A_, B, C)
-> R2 (B,F)

```

### *b)* 

```
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
A chave de R é composta pelos atributos A e B.

```


### *b)* 

```
Como existem dependências parciais:

Para A → D, E:
R1(A, D, E)

Para B → F:
R2(B, F)

Para {A, B} → C:
R3(A, B, C)
```


### *c)* 

```
Para F → G, H:
R4(F, G, H)

Para D → I, J:
R5(D, I, J)
```


## ​7.4
 
### *a)*

```
A chave de R é composta pelos atributos B e C.
```


### *b)* 

```
Para C → A:
R1(C, A)

Para D → E:
R2(D, E)

Para {B, C} → {A, C, D, E}:
R3(B, C, D)
```


### *c)* 

```
R1(C, A)
R2(D, E)
R3(B, C, D)

```



## ​7.5
 
### *a)*

```
A chave de R é composta pelos atributos A e B.

```

### *b)* 

```
Para A → C:
R1(A, C)

Para {A, B} → C, D, E:
R2(A, B, D, E)
```


### *c)* 

```
Para C -> D:
R2 (A, B, E)
R3(C, D)
```

### *d)* 

```
R1(A, C)
R2(A, B, E)
R3(C, D)
```
