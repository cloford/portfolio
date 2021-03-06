{
    "id": "bf93882b-c966-4c2b-8689-ca744a71e7f5",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "obj_floor_blow",
    "eventList": [
        {
            "id": "8fc7532e-a31f-4ad6-8c83-69969ad6bed0",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "bf93882b-c966-4c2b-8689-ca744a71e7f5"
        },
        {
            "id": "4c52560d-c24b-463f-bbdd-e5380bcba605",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "bf93882b-c966-4c2b-8689-ca744a71e7f5"
        },
        {
            "id": "f8656a4d-da9a-4df5-ab54-f668a6b2940c",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 8,
            "m_owner": "bf93882b-c966-4c2b-8689-ca744a71e7f5"
        },
        {
            "id": "53f060de-3c90-4149-b706-ac6b3ae6667b",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 12,
            "m_owner": "bf93882b-c966-4c2b-8689-ca744a71e7f5"
        },
        {
            "id": "1533abbd-4b3f-44a3-a565-5d87923f67de",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 4,
            "eventtype": 7,
            "m_owner": "bf93882b-c966-4c2b-8689-ca744a71e7f5"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "cc2faf68-fffb-4a35-934c-e9a205db7de6",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": [
                "0",
                "90",
                "180",
                "270"
            ],
            "multiselect": false,
            "rangeEnabled": true,
            "rangeMax": 380,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "blow_direction",
            "varType": 6
        },
        {
            "id": "f6b36034-70e5-4cf2-8ba4-7be476673783",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "90",
            "varName": "blow_power",
            "varType": 0
        },
        {
            "id": "24ab6352-e782-4710-872f-71361ed52e0c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "5",
            "varName": "blow_move_time",
            "varType": 0
        },
        {
            "id": "acaf8837-b869-45b2-a1bf-618f80cc877f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "30",
            "varName": "blow_time",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "3249f139-e997-4869-9bdb-835d937e6ea7",
    "visible": true
}