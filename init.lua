aura_env.debug = function(string)
    if aura_env.config.debug then
        print(string)
    end
end

aura_env.GetBookSpellIndex = function(spellId, bookType)
    aura_env.debug("GetBookSpellIndex("..spellId..","..bookType..") invoked")
    
    --1000 is maximum index
    for i=1,1000,1 do
        local skillType,bookSpellId = GetSpellBookItemInfo(i, bookType)
        if not skillType then
            break
        end
        
        aura_env.debug(i.." "..skillType.." "..bookSpellId)
        
        if bookSpellId == spellId then 
            aura_env.debug("Found spell id: "..spellId.." in bookType: "..bookType.. ".")
            return i
        end        
    end
    
    aura_env.debug("Spell id: "..spellId.." in bookType: "..bookType.. " not found.")
    return nil
end

--Wing Clip rank 1
aura_env.WingClipIndex = aura_env.GetBookSpellIndex(2974, "spell")
aura_env.AutoShotIndex = aura_env.GetBookSpellIndex(75, "spell")
aura_env.SixDemonBagItemId = 7734 --30 meters cast range

aura_env.IsValidEnemyUnit = function(unit)
    return UnitExists(unit) 
    and UnitIsVisible(unit) 
    and UnitCanAttack("player", unit) 
    and not UnitIsDead(unit)
end

aura_env.IsMeleeRange = function(unit)
    if IsSpellInRange(aura_env.WingClipIndex, "spell", unit) == 1 then
        aura_env.debug("Melee range with "..unit)
        return true
    end
    
    aura_env.debug("Not melee range with "..unit)
    return false
end

aura_env.IsAutoShotRange = function(unit)
    if IsSpellInRange(aura_env.AutoShotIndex, "spell", unit) == 1 then
        aura_env.debug("Auto shot range with "..unit)
        return true
    end
    
    aura_env.debug("Not auto shot range with "..unit)
    return false
end

aura_env.Is30MetersRange = function(unit) 
    if IsItemInRange(aura_env.SixDemonBagItemId, unit) then
        aura_env.debug("30 meters or less from "..unit)
        return true
    end
    
    aura_env.debug("More than 30 meters from "..unit)    
    return false
end