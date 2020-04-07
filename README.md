# Pets APIs

API hosted on `petdibs.herokuapp.com`

## Endpoints
- `GET /pets` Returns a list of all pets
- `GET /pets/:pet_id` where `:pet_id` is a pet id, such as `1`. Returns information on specific pet, by id
- `POST /pets` - Creates a new pet
  - Required Params:
    - name: string
  - Acceptable Params:
    - breed: string
    - age: integer
    - about: string
    - vaccinated: boolean
- `PUT /pets/1/vaccinated` - Updates status of vaccination of a specific pet, by id
  - Acceptable Params:
    - vaccinated: boolean
- `PUT /pets/1/dibs` - Update pet with owner, by pet id
  - Acceptable Params:
    - owner: string
- `DELETE /pets/:pet_id` where `:pet_id` is a pet id, such as `1`. Deletes a pet, by id
