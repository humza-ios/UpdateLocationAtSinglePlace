# Update Location At Single Place

1. Add CoreLocation.framework 
2. import CoreLocation in your model 
3. Just add Location.swift File in to your project .
4. Just add Below Code in to your Controller 

```
location = Location()
  location.responseBlock = { location in
        print(location.latitude)
        print(location.longitude)
 }
 location.errorBlock = { error in
        print(error.description)
 }
```
