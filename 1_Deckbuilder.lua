--- STEAMODDED HEADER
--- MOD_NAME: Deckbuilder
--- MOD_ID: Deckbuilder
--- MOD_AUTHOR: [SammyBloo]
--- MOD_DESCRIPTION: Start with no deck, and build it as you play.
--- PRIORITY: 102
----------------------------------------------
------------MOD CODE -------------------------
IN_SMOD1 = MODDED_VERSION >= '1.0.0'
SMODS.current_mod = SMODS.current_mod or {}

function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_deckbuilder = "Deckbuilder"
end

-- G.handlist

local function INIT()
    table.insert(G.CHALLENGES, #G.CHALLENGES + 1, {
        name = "Deckbuilder",
        id = 'c_mod_deckbuilder',
        rules = {
            custom = {},
            modifiers = {{
                id = 'joker_slots',
                value = 3
            }, {
                id = 'discards',
                value = 1
            }}
        },
        jokers = {{
            id = 'j_certificate',
            eternal = true
        }, {
            id = 'j_certificate'
        }, {
            id = 'j_certificate'
        }},
        consumeables = {},
        vouchers = {{
            id = 'v_magic_trick'
        }},
        deck = {
            type = 'Challenge Deck',
            cards = {{
                s = 'D',
                r = 'J',
                e = 'm_stone',
                g = 'Red'
            }, {
                s = 'D',
                r = 'J',
                e = 'm_stone'
            }, {
                s = 'D',
                r = 'J',
                e = 'm_stone'
            }, {
                s = 'D',
                r = 'J',
                e = 'm_stone'
            }, {
                s = 'D',
                r = 'J',
                e = 'm_stone'
            }}
        },
        restrictions = {
            banned_cards = {},
            banned_tags = {},
            banned_other = {}
        }
    })

    init_localization()
end

INIT()
SMODS.current_mod.process_loc_text()
if IN_SMOD1 then

else

end
