--- STEAMODDED HEADER
--- MOD_NAME: Level Up
--- MOD_ID: LevelUp
--- MOD_AUTHOR: [SammyBloo]
--- MOD_DESCRIPTION: In each round, each hand you play must be a higher rank than previous hands to score.
--- PRIORITY: 101
----------------------------------------------
------------MOD CODE -------------------------
IN_SMOD1 = MODDED_VERSION >= '1.0.0'
SMODS.current_mod = SMODS.current_mod or {}

function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_level_up = "Level Up"
    G.localization.misc.v_text.ch_c_increasing_rank =
        {"Each played hand must be a\nhand type of a higher rank\nthan any previous hand this round"}
end

-- G.handlist

local function INIT()
    table.insert(G.CHALLENGES, #G.CHALLENGES + 1, {
        name = "Level Up",
        id = 'c_mod_level_up',
        rules = {
            custom = {{
                id = 'increasing_rank'
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
                {id = 'bl_eye', type = 'blind'},
            }
        }
    })

    init_localization()
end

local Blind_debuff_hand_ref = Blind.debuff_hand 
function Blind:debuff_hand(cards, hand, handname, check)
    if self.disabled then
        return
    end
    if self.debuff then
        self.triggered = false
        if G.GAME.modifiers.increasing_rank == true then
            for i, v in ipairs(G.handlist) do
                if self.hands[v] == true then
                    self.triggered = true
                    return true
                end
                if v == handname then
                    if not check then self.hands[handname] = true end
                    break
                end
            end
        end
    end
    return Blind_debuff_hand_ref(self, cards, hand, handname, check)
end

local Blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)

    if G.GAME.modifiers.increasing_rank == true and not reset then
        self.hands = {
            ["Flush Five"] = false,
            ["Flush House"] = false,
            ["Five of a Kind"] = false,
            ["Straight Flush"] = false,
            ["Four of a Kind"] = false,
            ["Full House"] = false,
            ["Flush"] = false,
            ["Straight"] = false,
            ["Three of a Kind"] = false,
            ["Two Pair"] = false,
            ["Pair"] = false,
            ["High Card"] = false
        }
    end
    return Blind_set_blind_ref(self, blind, reset, silent)
end

INIT()
SMODS.current_mod.process_loc_text()
if IN_SMOD1 then

else

end
