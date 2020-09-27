function() 
    local unit = "target"
    
    return aura_env.IsValidEnemyUnit(unit) 
    and aura_env.Is30MetersRange(unit)
    and not aura_env.IsMeleeRange(unit) 
    and not aura_env.IsAutoShotRange(unit)
end