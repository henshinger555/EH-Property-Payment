--Exports

--Global Variables


RegisterCommand('paypropertymenu', function()
    lib.registerContext({
        {
            id = 'payment_menu',
            title = 'Payment for Properties',
            menu = 'property+_pay_menu',
            options = {
            {
                title = 'Property 1',
                description = 'Pink Cage #3',
                metadata = {
                    {label = 'Payment Ammount  :', value = 4000},
                    {label = 'Amount Remaining :', value = 'Rented'},
                },
                event = 'some_event',
                args = {property_id = 0}
            },
            {
                title = 'Property 2',
                description = 'Mirror Park House',
                metadata = {
                    {label = 'Payment Ammount ', value = 40000},
                    {label = 'Amount Remaining', value = 150000},
                    {label = 'progress', progress = 50},
                },
                event = 'some_event',
                args = {property_id = 1}
            },
            }
        },
        {
            id = 'payment_management',
            title = 'Payment Management',
            menu = 'property+_pay_menu',
            options = {
                {
                    title = 'Manage Clients',
                    menu = 'manage_client_menu',
                    description = 'Current list of Clients',
                },
                {
                    title = 'Funds Management',
                    menu = 'funds_management_menu',
                    description = 'Manage Funds',
                    metadata = {
                        {label = 'Current Balance  :', value = 40000},
                    },
                },
                {
                    title = 'Manage Staff',
                    menu = 'staff_mangement_menu',
                    description = 'Current list of Clients',
                },
            }
        },
        {
            id = 'current_clients',
            title = 'List of Current Clients',
            menu = 'payment_management',
            options = {
            {
                title = 'Cletus Finch',
                description = 'Pink Cage #3',
                metadata = {
                    {label = 'Payment Ammount  :', value = 4000},
                    {label = 'Amount Remaining :', value = 'Rented'},
                },
                event = 'some_event',
                args = {property_id = 0}
            },
            {
                title = 'Cobra Cobretti',
                description = 'Mirror Park House Address',
                metadata = {
                    {label = 'Payment Ammount  :', value = 40000},
                    {label = 'Amount Remaining :', value = 150000},
                },
                event = 'some_event',
                args = {property_id = 1}
            },
            }
        },
    })

    local mainMenu = {
        id = 'property_pay_menu',
        title = 'Property Payment',
        options = {
            {
                title = 'Pay Properties',
                menu = 'payment_menu',
                description = 'Make payments for your properties',
            },
            {
                title = 'Payment Management',
                menu = 'payment_management',
                description = 'Make payments for your properties',
            },
        }
    }

        clientMenu = {
            id = 'manage_client_menu',
            title = 'Manage Clients',
            options = {
            {
                title = 'Current Clients',
                menu = 'client_management',
                description = 'Make payments for your properties',
            },
            {
                title = 'Add Client',
                menu = 'payment_management',
                description = 'Make payments for your properties',
                event = 'HenPropertyPayment:Client:AddClient',

            },
        }

        }
    
    lib.registerContext(mainMenu)
    lib.registerContext(clientMenu)

    
    lib.showContext('property_pay_menu')
end)

RegisterNetEvent('HenPropertyPayment:Client:AddClient', function(parm1)

    local input = lib.inputDialog('Client Information', {
        { type = "input", label = "First Name" },
        { type = "input", label = "Last Name" },
        { type = "input", label = "Property"},
        { type = "checkbox", label = "Rental" },
        { type = "number", label = "Total Amount" },
        { type = "number", label = "Payment Amount" },
    })

    print(json.encode(input, {indent=true}))
    print(json.encode(parm1, {indent=true}))

    lib.showContext('payment_management')
    
end)


RegisterCommand('testinput', function()
    local input = lib.inputDialog('Client Information', {
        { type = "input", label = "First Name" },
        { type = "input", label = "Last Name" },
        { type = "input", label = "Property"},
        { type = "checkbox", label = "Rental" },
        { type = "number", label = "Total Amount" },
        { type = "number", label = "Payment Amount" },
    })
    print(json.encode(input, {indent=true}))

end)


RegisterCommand('testcontext', function()
    lib.registerContext({
        id = 'example_menu',
        title = 'Example Context',
        options = {
            {title = 'Empty button'},
            {
                title = 'Example button',
                description = 'Example button description',
                metadata = {
                    {label = 'Value 1', value = 'Some value'},
                    {label = 'Value 2', value = 300},
                }
            },
            {
                title = 'Menu button',
                menu = 'other_example_menu',
                description = 'Takes you to another menu!',
                metadata = {'It also has metadata support'}
            },
            {
                title = 'Event button',
                description = 'Open a menu and send event data',
                arrow = true,
                event = 'some_event',
                args = {value1 = 300, value2 = 'Other value'}
            }
        },
        {
            id = 'other_example_menu',
            title = 'Other Context Menu',
            menu = 'example_menu',
            options = {
                ['Nothing here'] = {}
            }
        }
    })
    lib.showContext('example_menu')
end)

RegisterNetEvent('some_event', function(parm1, parm2)

    print("Triggered some_event")
    print(json.encode(parm1, {indent=true}))

    
end)

--QB Core Specific Functions
local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    local Player = QBCore.Functions.GetPlayerData()
print(json.encode(Player, {indent=true}))

end)


