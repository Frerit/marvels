# Prueba DD3

Esta prueba está basada en la habilidad de poder consumir datos de un servicio en la nube. El reto consiste en desarrollar una aplicación que permita listar todos los superhéroes del universo marvel, así como los eventos en los que han incursionando y los cómics en los que han participado al día de hoy.
Para está prueba se proporcionará las apis de datos con las cuales se podrá establecer la comunicación con los servicios
El propósito de la prueba es evaluar la capacidad de resolución de problemas, así como la habilidad para establecer flujos en una aplicación haciendo uso de buenas prácticas de desarrollo.


---
## Requerimientos:

1. Mostrar en un paginador la lista de superhéroes resultado de la consulta del servicio “https://gateway.marvel.com:443/v1/public/characters”
2. Cada superhéroe contará con sus propios eventos en los que ha participado, así como los cómics donde ha aparecido. Es importante mostrar para cada superhéroe dicha información.


    
    
```sh

GET /v1/public/characters/{characterId}/comics
GET /v1/public/characters/{characterId}/events
GET /v1/public/characters/{characterId}/series
GET /v1/public/characters/{characterId}/stories

```

## Consideraciones:

Para hacer uso del api es necesario construir un HASH dinámico siendo el resultado del cifrado en MD5 utilizando el public key, private key, timeStamp.

### - ejemplo:

```sh

https://gateway.marvel.com:443/v1/public/characters?apikey=fea4ddbf370376865724c2b03db5ffef&h ash=c3de3454e8dc6486f0e30e8f937745fe&ts=1677784856

```
La construcción del HASH = md5(timeStamp+privateKey+publicKey) cada llamada al api deberá construirse un nuevo HASH