--- STEAMODDED HEADER
--- MOD_NAME: No Mult
--- MOD_ID: NoMult
--- MOD_AUTHOR: [SammyBloo]
--- MOD_DESCRIPTION: All mult jokers are banned.
--- PRIORITY: 104
----------------------------------------------
------------MOD CODE -------------------------
IN_SMOD1 = MODDED_VERSION >= '1.0.0'
SMODS.current_mod = SMODS.current_mod or {}

function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_no_mult = "No Mult"
end

-- G.handlist

local function INIT()
    table.insert(G.CHALLENGES, #G.CHALLENGES + 1, {
        name = "No Mult",
        id = 'c_mod_no_mult',
        rules = {
            custom = {{id = 'no_mult'},},
            modifiers = {}
        },
        jokers = {},
        consumeables = {},
        vouchers = {},
        deck = {
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {{
                id = 'j_joker'
            }, {
                id = 'j_greedy_joker'
            }, {
                id = 'j_lusty_joker'
            }, {
                id = 'j_wrathful_joker'
            }, {
                id = 'j_gluttenous_joker'
            }, {
                id = 'j_jolly'
            }, {
                id = 'j_zany'
            }, {
                id = 'j_mad'
            }, {
                id = 'j_crazy'
            }, {
                id = 'j_droll'
            }, {
                id = 'j_half'
            }, {
                id = 'j_stencil'
            },{
                id = 'j_green_joker'
            }, {
                id = 'j_ceremonial'
            }, {
                id = 'j_mystic_summit'
            }, {
                id = 'j_loyalty_card'
            }, {
                id = 'j_misprint'
            }, {
                id = 'j_raised_fist'
            }, {
                id = 'j_fibonacci'
            }, {
                id = 'j_steel_joker'
            }, {
                id = 'j_abstract'
            }, {
                id = 'j_gros_michel'
            }, {
                id = 'j_even_steven'
            }, {
                id = 'j_scholar'
            }, {
                id = 'j_supernova'
            }, {
                id = 'j_ride_the_bus'
            }, {
                id = 'j_blackboard'
            }, {
                id = 'j_constellation'
            }, {
                id = 'j_cavendish'
            }, {
                id = 'j_card_sharp'
            }, {
                id = 'j_red_card'
            }, {
                id = 'j_madness'
            }, {
                id = 'j_vampire'
            }, {
                id = 'j_hologram'
            }, {
                id = 'j_baron'
            }, {
                id = 'j_obelisk'
            }, {
                id = 'j_photograph'
            }, {
                id = 'j_erosion'
            }, {
                id = 'j_fortune_teller'
            }, {
                id = 'j_lucky_cat'
            }, {
                id = 'j_baseball'
            }, {
                id = 'j_flash'
            }, {
                id = 'j_popcorn'
            }, {
                id = 'j_trousers'
            }, {
                id = 'j_ancient'
            }, {
                id = 'j_ramen'
            }, {
                id = 'j_walkie_talkie'
            }, {
                id = 'j_smiley'
            }, {
                id = 'j_campfire'
            }, {
                id = 'j_swashbuckler'
            }, {
                id = 'j_throwback'
            }, {
                id = 'j_bloodstone'
            }, {
                id = 'j_onyx_agate'
            }, {
                id = 'j_glass'
            }, {
                id = 'j_flower_pot'
            }, {
                id = 'j_idol'
            }, {
                id = 'j_seeing_double'
            }, {
                id = 'j_hit_the_road'
            }, {
                id = 'j_duo'
            }, {
                id = 'j_trio'
            }, {
                id = 'j_family'
            }, {
                id = 'j_order'
            }, {
                id = 'j_tribe'
            }, {
                id = 'j_shoot_the_moon'
            }, {
                id = 'j_drivers_license'
            }, {
                id = 'j_bootstraps'
            }, {
                id = 'j_acrobat'
            }, {
                id = 'c_wheel_of_fortune'
            },
            {id = 'c_hex'},
            {id = 'c_soul'},},
            banned_tags = {
                {id = 'tag_holo'},
                {id = 'tag_polychrome'},
            },
            banned_other = {}
        }
    })
    init_localization()
end

local poll_edition_ref = poll_edition
function poll_edition(_key, _mod, _no_neg, _guaranteed)
    local result = poll_edition_ref(_key, _mod, _no_neg, _guaranteed)
    if G.GAME.modifiers.no_mult == true and result and result.polychrome then
        result = nil
    end
    if G.GAME.modifiers.no_mult == true and result and result.holo then
        result = nil
    end
    return result
end

INIT()
SMODS.current_mod.process_loc_text()
if IN_SMOD1 then

else

end
