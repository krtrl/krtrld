import os, json
import ../../backends/wrapper/packages
    
proc getPackageInfo*(name: string): JsonNode =
    ## Gets the package information
    %*{
        "name": name,
        "version": "1.0.0", 
        "description": "A package that does something",
        "repository": ""
      } 

