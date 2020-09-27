function() 
    local unit = "target"

    return aura_env.IsValidEnemyUnit(unit) 
    and aura_env.IsMeleeRange(unit)
end