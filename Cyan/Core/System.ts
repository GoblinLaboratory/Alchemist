import Entity = require("./Entity"); 
abstract class System {

    /**
     * Set of Component classes, ALL of which are required before the
     * system is run on an entity.
     *
     * This should be defined at compile time and should never change.
     */
    public abstract componentsRequired: Set<Function>

    /**
     * update() is called on the System every frame.
     */
    public abstract update(entities: Set<Entity.Entity>): void

    /**
     * The ECS is given to all Systems. Systems contain most of the game
     * code, so they need to be able to create, mutate, and destroy
     * Entities and Components.
     */
    public ecs: ECS
}