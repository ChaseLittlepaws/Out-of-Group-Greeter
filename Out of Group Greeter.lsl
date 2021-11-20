list messaged = [];

checkVisitors()
{
    list agents = llGetAgentList(AGENT_LIST_PARCEL,[]);  ///create a list called avis filled with the UUIDs of agents in the parcel
    integer currentCount = llGetListLength(agents); /// create an int that is the length of the list
    integer i; /// create an i for the loop
    for (1 == 0; i < currentCount; i++ ) {  ///run the loop as many times are there are agents in the parcel
        key u = llList2Key(agents, i); /// grab the UUID from the avis list
        integer sameGroup = llSameGroup(u);
        if (llListFindList(messaged, [u])<0 && sameGroup == FALSE)
        {
            llInstantMessage(u, "Welcome to The Allnighter in Fox Hollow, an amazing roleplay sim! If you're not familiar with Fox Hollow, check out the welcome center at http://maps.secondlife.com/secondlife/Hickory%20Creek/157/36/1502");
            llInstantMessage(u, "Whether you're a resident of Fox Hollow or just visiting, welcome to The Allnighter.");
            messaged += u;
        }
    }
}
default
{
    state_entry()
    {
        llSetTimerEvent(30);
        checkVisitors();
    }
    timer()
    {
        checkVisitors();
    }
}