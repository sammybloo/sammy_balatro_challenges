--- STEAMODDED HEADER
--- MOD_NAME: Serialised
--- MOD_ID: Serialised
--- MOD_AUTHOR: [SammyBloo]
--- MOD_DESCRIPTION: Hands will not score if you have more than one joker of a certain rarity. 
--- PRIORITY: 101
----------------------------------------------
------------MOD CODE -------------------------
IN_SMOD1 = MODDED_VERSION >= '1.0.0'
SMODS.current_mod = SMODS.current_mod or {}

function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_serialised = "Serialised"
    G.localization.misc.v_text.ch_c_unique_rarity =
        {"Hands will not score if you have\nmultiple jokers with the same rarity"}
end

-- G.handlist

local function INIT()
    table.insert(G.CHALLENGES, #G.CHALLENGES + 1, {
        name = "Level Up",
        id = 'c_mod_serialised',
        rules = {
            custom = {{
                id = 'unique_rarity'
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
            banned_other = {
                {id = 'bl_final_bell', type = 'blind'},
            }
        }
    })

    init_localization()
end

local Card_move_ref = Card.move 
function Card:move(dt)
    Moveable.move(self, dt)
    --self:align()
    if self.children.h_popup then
        self.children.h_popup:set_alignment(self:align_h_popup())
    end

    if G.GAME.modifiers.unique_rarity == true then
        
        local rarities = {false, false, false, false}
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if rarities[G.jokers.cards[i].config.center.rarity] == true then 
                    G.jokers.cards[i]:set_debuff(true)
             else
                    G.jokers.cards[i]:set_debuff(false)
                end
                rarities[G.jokers.cards[i].config.center.rarity] = true
            end
        end
    end
end

INIT()
SMODS.current_mod.process_loc_text()
if IN_SMOD1 then

else

end
