-- 数据
Data = {}
Data["职业"] = {
    [1] = {
        Name = "战士",
        ID = 'RzZh',
        Art = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp",
        -- Explain = "这个由步兵一步步走上来的将领有着一套独特的战斗方式。进攻即是防守，防守即是进攻。"
        Explain = [[战士为战斗细致地装备好自己，迎面冲向仇敌，攻击划过他们沉重的铠甲。他们以各式战斗策略和多种武器保护他们易受伤的盟友。
        战士必须小心地控制他们的怒气，是用来施放技能的能量，这样才能充分发挥战斗力。]],
        State = true
    },
    [2] = {
        Name = "圣骑士",
        ID = 'RzSQ',
        Art = "ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp",
        Explain = [[圣骑士径直站在他们的敌人前方，依靠重甲和治愈术可以所向披靡并毫发无损。不论是使用巨大的盾牌还是挥舞着毁灭性的双手武器，
        圣骑士总能够保护同伴免受敌人伤害，他们也可使用治疗术使他们立于不败之地。]],
        State = true
    },
    [3] = {
        Name = "法师",
        ID = 'RzBF',
        Art = "ReplaceableTextures\\CommandButtons\\BTNHeroArchMage.blp",
        Explain = [[法师们用神秘的咒语摧毁他们的敌人。虽然他们使用强大的攻击性法术，但法师其实护甲单薄防御低，
        使得他们特别容易受到近距离攻击。精明的法师会精心使用法术将他们的敌人限制在一定距离或者控制在适当的位置。]],
        State = true
    },
    [4] = {
        Name = "萨满",
        ID = 'RzMD',
        Art = "ReplaceableTextures\\CommandButtons\\BTNShaman.blp",
        Explain = [[在战斗中，萨满祭司将减益类图腾或者操纵类图腾置于地面，牵制敌人的同时最大化增益图腾效果。
        萨满祭司是多面手，既能近距离也能远距离攻击，但明智的萨满祭司是根据敌人的优势和弱势选择攻击位置。]],
        State = true
    },
    [5] = {
        Name = "牧师",
        ID = 'RzMS',
        Art = "ReplaceableTextures\\CommandButtons\\BTNPriest.blp",
        Explain = [[牧师们使用着强大的治疗魔法来保护他们自己和同伴。他们也能在远处施放强大的攻击性法术，但因为其体能上的弱势与单薄的装备，
        会有被击倒的可能。经验丰富的牧师在负责保护同盟生命的时候会小心地使用他们的攻击性法术。]],
        State = true
    },
    [6] = {
        Name = "刺客",
        ID = 'RzMS',
        Art = "ReplaceableTextures\\CommandButtons\\BTNHeroWarden.blp",
        Explain = [[刺客经常从暗处以偷袭方式发起攻击，率先进行狠毒的近身格斗。在持久战中，他们会利用一套经过精心挑选的连续组合攻击削弱敌人的实力以便施行致命的一击。
        刺客在选择目标的时候必须特别谨慎，使他们的组合攻击不至于浪费。如果战斗对他们不利，则必须清楚何时该隐匿或逃逸。]],
        State = true
    },
    [7] = {
        Name = "术士",
        ID = 'RzMS',
        Art = "ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp",
        Explain = [[术士用削弱性疾病和黑暗魔法的组合去烧毁和消灭那些变弱的敌人。虽然恶魔宠物保护和加强了他们，但术士依然从远处攻击他们的敌人。
        因为身体太过虚弱而无法穿戴重甲，精明的术士让他们仆从首当其冲地接受敌人的攻击，以便保证自己的安全。]],
        State = true
    },
    [8] = {
        Name = "射手",
        ID = 'RzMS',
        Art = "ReplaceableTextures\\CommandButtons\\BTNSylvanusWindrunner.blp",
        Explain = [[射手远距离与敌人作战，他们使用弓箭或枪攻击敌人。]],
        State = true
    },
    [9] = {
        Name = "德鲁伊",
        ID = 'RzMS',
        Art = "ReplaceableTextures\\CommandButtons\\BTNFurion.blp",
        Explain = [[德鲁伊是多才多艺的战士，因为他们几乎能满足每一个角色的治疗、肉盾和伤害输出。德鲁伊必须根据情况来决定他们选择什么形态，
        因为每一种形态都有着特殊的用途。]],
        State = true
    },
    Count = 9
}
return Data
