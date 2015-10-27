# mudCat

MudCat is the preview of EDCATv2.  It consists of a [JSONAPI](http://jsonapi.org) compliant way of storing and retrieving content in
[DCAT](http://www.w3.org/TR/vocab-dcat/).

## What is supported

All properties shown in the
[W3C DCAT specification overview](http://www.w3.org/TR/vocab-dcat/#overview) are supported.
Attribute names are written in dasherized form, should they have a capital.  Resource names are the
lowercased plural form of the lats part of their URI.

 - /catalogs/
 - /datasets/
 - /distributions/
 - /catalog-records/
 - /concepts/
 - /concept-schemes/
 - /agents/
 
## Example calls

The JSONAPI spec should give most guidance.  The following code samples indicate how a request could
be made, and what the responses could be.

Note that the use of UUIDs makes it that these examples can't easily be copy-pasted into your own
installation with everything still working.


First let's request all Catalogs

    GET http://dcat.semte.ch/catalogs/
  
    RESPONSE
    {
      "data: []
    }

Nothing there?  Time to add one!

    POST http://dcat.semte.ch/catalogs/
    Accept:       application/vnd.api+json
    Content-Type: application/vnd.api+json
    {
      "data": {
        "attributes": {
          "title": "My first catalog"
        },
        "type": "catalogs"
      }
    }

    RESPONSE
    {
      "links": {
        "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA"
      },
      "data": {
        "relationships": {
          "record": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/record",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/record"
            }
          },
          "theme-taxonomy": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/theme-taxonomy",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/theme-taxonomy"
            }
          },
          "publisher": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/publisher",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/publisher"
            }
          },
          "datasets": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/datasets",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/datasets"
            }
          }
        },
        "type": "catalogs",
        "id": "AE4A6DDB-FCE1-4563-A856-E4D826DF00FA",
        "attributes": {
          "title": "My first catalog"
        }
      }
    }

JSON-API is a discoverable API.  The links are visible when you execute a request.  Let's first add a
dataset to our catalog, so we can see the connection:

    POST http://dcat.semte.ch/datasets/
    Accept:       application/vnd.api+json
    Content-Type: application/vnd.api+json
    { 
      "data": {
        "attributes": {
          "title": "EDCAT 2.0 manual",
          "description": "The EDCAT 2.0 manual in various forms"
        },
        "relationships": {
          "catalog": {
            "data": {
              "type": "catalogs",
              "id": "AE4A6DDB-FCE1-4563-A856-E4D826DF00FA"
            }
          }
        },
        "type": "datasets"
      }
    }

    RESPONSE
    {
      "links": {
        "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8"
      },
      "data": {
        "relationships": {
          "primary-topic": {
            "links": {
              "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/primary-topic",
              "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/primary-topic"
            }
          },
          "catalog": {
            "links": {
              "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/catalog",
              "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/catalog"
            }
          },
          "publisher": {
            "links": {
              "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/publisher",
              "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/publisher"
            }
          },
          "distributions": {
            "links": {
              "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/distributions",
              "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/distributions"
            }
          },
          "themes": {
            "links": {
              "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/themes",
              "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/themes"
            }
          }
        },
        "type": "datasets",
        "id": "192FD792-085D-4348-90DB-E5D8C9CC90A8",
        "attributes": {
          "id": "192FD792-085D-4348-90DB-E5D8C9CC90A8",
          "description": "The EDCAT 2.0 manual in various forms",
          "title": "EDCAT 2.0 manual"
        }
      }
    }

We can now follow the link to the dataset's catalog:

    GET http://dcat.semte.ch/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/catalog
    
    RESPONSE
    {
      "links": {
        "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/catalog",
        "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/catalog"
      },
      "data": {
        "relationships": {
          "record": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/record",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/record"
            }
          },
          "theme-taxonomy": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/theme-taxonomy",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/theme-taxonomy"
            }
          },
          "publisher": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/publisher",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/publisher"
            }
          },
          "datasets": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/datasets",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/datasets"
            }
          }
        },
        "type": "catalogs",
        "id": "AE4A6DDB-FCE1-4563-A856-E4D826DF00FA",
        "attributes": {
          "description": "This is my first catalog"
        }
      }
    }

We can follow the link to the dataset back again from here on:

    GET /catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/datasets
    
    RESPONSE
    {
      "links": {
        "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/datasets",
        "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/datasets"
      },
      "data": [
        {
          "relationships": {
            "primary-topic": {
              "links": {
                "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/primary-topic",
                "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/primary-topic"
              }
            },
            "catalog": {
              "links": {
                "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/catalog",
                "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/catalog"
              }
            },
            "publisher": {
              "links": {
                "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/publisher",
                "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/publisher"
              }
            },
            "distributions": {
              "links": {
                "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/distributions",
                "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/distributions"
              }
            },
            "themes": {
              "links": {
                "related": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/themes",
                "self": "/datasets/192FD792-085D-4348-90DB-E5D8C9CC90A8/links/themes"
              }
            }
          },
          "type": "datasets",
          "id": "192FD792-085D-4348-90DB-E5D8C9CC90A8",
          "attributes": {
            "description": "The EDCAT 2.0 manual in various forms",
            "title": "EDCAT 2.0 manual"
          }
        }
      ]
    }

Updating values boils down to sending a PATCH request to the corresponding resource

    PATCH /catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA
    Accept:       application/vnd.api+json
    Content-Type: application/vnd.api+json
    {
      "data": {
        "attributes": {
          "description": "This is the catalog from the README",
          "language": "en",
          "title": "Example catalog"
        },
        "type": "catalogs",
        "id": "AE4A6DDB-FCE1-4563-A856-E4D826DF00FA"
      }
    }
    
    RESPONSE
    204 No Content

Fetching the catalog again shows the new results

    GET /catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA

    RESPONSE
    {
      "links": {
        "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA"
      },
      "data": {
        "relationships": {
          "record": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/record",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/record"
            }
          },
          "theme-taxonomy": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/theme-taxonomy",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/theme-taxonomy"
            }
          },
          "publisher": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/publisher",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/publisher"
            }
          },
          "datasets": {
            "links": {
              "related": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/datasets",
              "self": "/catalogs/AE4A6DDB-FCE1-4563-A856-E4D826DF00FA/links/datasets"
            }
          }
        },
        "type": "catalogs",
        "id": "AE4A6DDB-FCE1-4563-A856-E4D826DF00FA",
        "attributes": {
          "language": "en",
          "description": "This is my first catalog",
          "title": "Example catalog"
        }
      }
    }
