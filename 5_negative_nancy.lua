--- STEAMODDED HEADER
--- MOD_NAME: Negative Nancy
--- MOD_ID: NegativeNancy
--- MOD_AUTHOR: [SammyBloo]
--- MOD_DESCRIPTION: Always gain the Negative Joker tag when skipping Blinds. You get 0 joker slots.
--- PRIORITY: 106
----------------------------------------------
------------MOD CODE -------------------------

IN_SMOD1=MODDED_VERSION>='1.0.0'
SMODS.current_mod=SMODS.current_mod or {}

function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_negative_nancy = "Negative Nancy"
    G.localization.misc.v_text.ch_c_free_negative_tag =
        {"Always gain the {c:Attention}Negative Joker{} tag when skipping Blinds"}
end

local function INIT()
    table.insert(G.CHALLENGES, #G.CHALLENGES + 1, {
        name = "Negative Nancy",
        id = 'c_mod_negative_nancy',
        rules = {
            custom = {
                {id = 'free_negative_tag'},
            },
            modifiers = {{
                id = 'joker_slots',
                value = 1
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

local skip_blind_ref = G.FUNCS.skip_blind
G.FUNCS.skip_blind = function(e)
        skip_blind_ref(e)
        if G.GAME.modifiers.free_negative_tag == true then
            add_tag(Tag('tag_negative'))
        end
    end

INIT()
SMODS.current_mod.process_loc_text()
if IN_SMOD1 then
    
else
    
end