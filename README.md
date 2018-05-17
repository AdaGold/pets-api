# Pets APIs

API hosted on `petdibs.herokuapp.com`

## Endpoints
- `GET /pets` returns all pets
- `GET /pets/1` returns information on specific pet, by id
- `POST /pets` - Create a new pet
  - Required Params:
    - name: string
  - Acceptable Params:
    - breed: string
    - age: integer
    - about: string
    - vaccinated: boolean
- `PUT /pets/1/vaccinated` - update status of vaccination of a specific pet, by id
  - Acceptable Params:
    - vaccinated: boolean
- `PUT /pets/1/dibs` - update pet with owner, by pet id
  - Acceptable Params:
    - owner: string
- `DELETE /pets/1` to delete a pet, by id
