--- STEAMODDED HEADER
--- MOD_NAME: Fish Market
--- MOD_ID: FishMarket
--- MOD_AUTHOR: [SammyBloo]
--- MOD_DESCRIPTION: All Jokers are Perishable.
--- PRIORITY: 103
----------------------------------------------
------------MOD CODE -------------------------
IN_SMOD1 = MODDED_VERSION >= '1.0.0'
SMODS.current_mod = SMODS.current_mod or {}

function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_fish_market = "Fish Market"
    G.localization.misc.v_text.ch_c_all_perishable =
        {"All Jokers are {C:attention}Perishable{}"}
end

-- G.handlist

local function INIT()
    table.insert(G.CHALLENGES, #G.CHALLENGES + 1, {
        name = "Fish Market",
        id = 'c_mod_fish_market',
        rules = {
            custom = {{
                id = 'all_perishable'
            }}
        },
        jokers = {},
        consumeables = {},
        vouchers = {},
        deck = {
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                {id = 'j_ceremonial'}, 
                {id = 'j_ride_the_bus'},
                {id = 'j_runner'},
                {id = 'j_constellation'},
                {id = 'j_green_joker'},
                {id = 'j_red_card'},
                {id = 'j_madness'},
                {id = 'j_square'},
                {id = 'j_vampire'},
                {id = 'j_hologram'},
                {id = 'j_rocket'},
                {id = 'j_obelisk'},
                {id = 'j_lucky_cat'},
                {id = 'j_flash'},
                {id = 'j_trousers'},
                {id = 'j_castle'},
                {id = 'j_glass'},
                {id = 'j_wee'},
            },
            banned_tags = {},
            banned_other = {}
        }
    })

    init_localization()
end

local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local card = create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if _type == 'Joker' and card and G.GAME.modifiers.all_perishable then card:set_perishable(true) end
    return card
end

INIT()
SMODS.current_mod.process_loc_text()
if IN_SMOD1 then

else

end

