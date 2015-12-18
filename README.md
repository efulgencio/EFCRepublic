CUESTIONARIO

1. En POO, ¿qué diferencia hay entre una interface y una clase abstracta?. Indica una situación donde consideres más interesante utilizar interfaces y otras 
donde usarías clases abstractas.

Interface defiene un método que obliga a las clases que la incluyen a implementar el método.
Una clase abstracta se comporta de manera similar, define método que se deben de implementar, pero en este caso referente a las clases que heredan.

En el caso de una herencia como por ejemplo la clase IMPRESO, definimos una clase abstracta con los métodos printCabecera, printPiePapel. Todos los documentos (factura, albarán, ticket) que heredan de IMPRESO están obligados a implementar esos métodos.

En el caso de una clase Libro y una clase Cartel declaramos una interface que declara un método llamado imprimir. Los dos tiene esa comportamiento de ser impreso pero no hay más comportamientos que hagan una relación de herencia.


2. Supongamos que tienes una query ( un SELECT con WHERE e INNER JOINS ) muy lenta en MySQL, ¿qué podrías hacer para intentar optimizarla?

Por un lado creando índices entre los campos que intervienen en la sentencia y por otro el orden de los campos en el apartado where de la sentencia.


3. ¿Qué diferencias hay entre una API Rest y una API Soap?


4. Define un par de patrones de diseño que hayas utilizado y en qué casos son útiles.

 Singleton,  creación de una única instancia de una clase que es accesible por toda la app, este patrón lo utilizo
 como contenedor de información y estado que varias pantallas de la App 
 Observer, 
  una entrada en mi blog tengo un ejemplo de kvc - kvo
  http://onedayoneknowing.blogspot.com.es/2015/06/relacion-entre-kvc-y-kvo-key-value.html
 

5. ¿Qué factores son importantes tener en cuenta durante el proceso de carga de datos en una App?

   - Intento evitar una carga inicial excesiva en el proceso de carga de datos.
   - En el caso de una App de venta de productos, los datos básicos como categorias y productos prefiero almacenarlos en una base de datos almacenada en dispositivo, para que no sea necesaria un carga inicial. Si el usuario quiere bajar de nivel y solicitar más detalle de producto sí que tendría que acceder mediante llamadas a URL para obtener los datos. 
   
   - En los proyecto que he desarrollado App "Montseny" los datos están almacenados en una base de datos Sqlite.
   - El resto de datos se obtienen de back office del que voy a obtener ficheros xml siempre que la versión de los datos se han actualizado. Los ficheros xml se almacenan en el dispositivo. 
  
6. ¿Qué métodos de persistencia de información (almacenamiento de datos) están disponibles y cuáles usarías?

   - Core Data
   - Almacenar en el aréa de la App
   - Serializar objetos

7. Explica 3 buenas prácticas para conseguir una interfaz fluida en una App.

  

8. En desarrollo, ¿puedes contarnos algunos "horrores de programación" que hayas encontrado?

  Estas son las cosas que no me gustan.
  
  - No me gusta ver código repetido, código sin comentar, nombres de propiedades que no dan una idea de lo que contienen, métodos con muchas líneas de código.
   
  A la hora de desarrollar mi modo de programar es similar a los proyectos que tengo en

  https://github.com/efulgencio
  
  Mi objetivo es no tener mucho código en los UIViewController, aplicar una arquitectura que separe el modelo, la presentación, el controller, clases helpers, y declarando pruebas unitarias tanto en procesos como en UI.
  
  
  
