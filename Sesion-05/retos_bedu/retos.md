
#

## Reto 1: Expresiones regulares

Usando la base de datos `sample_airbnblistingsAndReviews` encontrar: 

- Propiedades que no permitan fiestas.
```
[{$project: {
  house_rules: 1,
  _id: 0
}}, {$match: {
  house_rules: /No parties/i 
}}]
```

- Propiedades que admitan mascotas.
```
[{$project: {
  house_rules: 1,
  _id: 0
}}, {$match: {
  house_rules:  /pets allowed/i
}}]
```

- Propiedades que no permitan fumadores.
```
[{$project: {
  house_rules: 1,
  _id: 0
}}, {$match: {
  house_rules:  /not smoking|no smokers/i
}}]
```

- Propiedades que no permitan fiestas ni fumadores.
```
[{$project: {
  house_rules: 1,
  _id: 0
}}, {$match: {
  house_rules:  /not smoking|no smokers|no parties/i
}}]
```

* * *  

## Reto 2: Notación punto y arreglos
Usando la base de datos `sample_airbnblistingsAndReviews` encontrar: 

Agrega un filtro que permita obtener todas las publicaciones que tengan 50 o más comentarios, que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet vía cable y estén ubicada en Brazil

```
[{$project: {
  number_of_reviews: 1,
  amenities: 1,
  reviews: 1,
  "review_scores.review_scores_rating" : 1,
  "address.country_code": 1
}}, {$match: {
 number_of_reviews: {$gte: 50},
 "review_scores.review_scores_rating": {$gte: 80},
  amenities: {$in: [/Ethernet/i]},
  "address.country_code": "BR"

 }}]
```

* * * 
## Reto 3: Introducción a las agregaciones

Usando la colección `sample_airbnb.listingsAndReviews`, mediante el uso de agregaciones, encontrar el número de publicaciones que tienen conexión a Internet, sea desde Wifi o desde cable (Ethernet).

```
[{$match: {
  amenities: {$in: ["Ethernet","Internet", "Wifi"]}
}}]
```
