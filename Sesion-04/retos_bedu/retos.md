# Retos: Colecciones, Documentos y Proyecciones

## Reto 1
### Reto 1: Fecha, nombre y texto de cada comentario.
```
[{$project: {
  date: 1, nombre:1, text: 1, _id:0
}}]
```

## Reto 1: Título, elenco y año de cada película
```
[{$project: {
  title: 1, cast:1, year:1, _id:0
}}]
```

## Reto 1: Nombre y contraseña de cada usuario
```
[{$project: {
  name: 1, password: 1, _id:0
}}]
```

***

## Reto 2: Filtros básicos
Usa la base de datos `sample_mflix` para responder" 

- ¿Qué comentarios ha hecho Greg Powell? 
```
[{$project: {
  text: 1, name: 1
}
}, {$match: {
  name: {$eq: "Greg Powell"}
}}]
```
- ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?
```
[{$project: {
  text: 1, name: 1, _id:0
}
}, {$match: {
  $or: [{name: {$eq: "Greg Powell"}},{name: {$eq: "Mercedes Tyler"}}]
}}]
```
- ¿Cuál es el máximo número de comentarios en una película?
```
[{$project: {
  num_mflix_comments: 1, 
  title: 1, 
  _id: 0
}}, {$sort: {
  num_mflix_comments: -1
}}, {$limit: 1}]
```
- ¿Cuál es título de las cinco películas más comentadas?
```
[{$project: {
  num_mflix_comments: 1, 
  title: 1, 
  _id: 0
}}, {$sort: {
  num_mflix_comments: -1
}}, {$limit: 5}]
``

