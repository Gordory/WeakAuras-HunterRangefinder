function() 
    local unit = "target"
    
    return aura_env.IsValidEnemyUnit(unit) 
    and not aura_env.Is30MetersRange(unit)
    and aura_env.IsAutoShotRange(unit)    
end