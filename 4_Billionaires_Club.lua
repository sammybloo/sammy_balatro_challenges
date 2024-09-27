--- STEAMODDED HEADER
--- MOD_NAME: Billionaire's Club
--- MOD_ID: BillionairesClub
--- MOD_AUTHOR: [SammyBloo]
--- MOD_DESCRIPTION: You get 20 joker slots, but boss blinds become much harder.
--- PRIORITY: 105
----------------------------------------------
------------MOD CODE -------------------------

IN_SMOD1=MODDED_VERSION>='1.0.0'
SMODS.current_mod=SMODS.current_mod or {}

function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_billionaires_club = "Billionaire's Club"
    G.localization.misc.v_text.ch_c_billionaire_scaling =
        {"{C:attention}Chip requirements{} start at 100 and scale to 1,000,000,000"}
end

local function INIT()
    table.insert(G.CHALLENGES, #G.CHALLENGES + 1, {
        name = "Billionaire's Club",
        id = 'c_mod_billionaires_club',
        rules = {
            custom = {
                {id = 'billionaire_scaling'},
            },
            modifiers = {{
                id = 'joker_slots',
                value = 20
            }}
        },
        jokers = {},
        consumeables = {},
        vouchers = {},
        deck = {
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {},
            banned_tags = {},
            banned_other = {}
        }
    })

    init_localization()
end

local get_blind_amount_ref = get_blind_amount
function get_blind_amount(ante)
    local k = 0.75
    if G.GAME.modifiers.billionaire_scaling == true then
        local amounts = {50, 500, 5000, 50000, 500000, 5000000, 50000000, 500000000}
        if ante < 1 then
            return 100
        end
        if ante <= 8 then
            return amounts[ante]
        end
        local a, b, c, d = amounts[8], 1.6, ante - 8, 1 + 0.2 * (ante - 8)
        local amount = math.floor(a * (b + (k * c) ^ d) ^ c)
        amount = amount - amount % (10 ^ math.floor(math.log10(amount) - 1))
        return TalismanCompat(amount)
    end
    return get_blind_amount_ref(ante)
end

INIT()
SMODS.current_mod.process_loc_text()
if IN_SMOD1 then
    
else
    
end