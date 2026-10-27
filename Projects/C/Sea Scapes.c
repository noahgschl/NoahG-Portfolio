#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int menu();
int dealDmg(int range, int start); //This will be used for both the player and enemy to calculate damage
int healDmg(int range, int start); //This will be used for both the player and enemy to calculate healing
int enemyTurn(); //This is used for a random number that will determine what the enemy does on it's turn
int playAgain(); //This is for the recursiveness of the program

int main()
{
    srand(time(0)); //Uses epoch time for randomness

    int play = 1; //Used for resursiveness, if this is not one, the program will stop

    puts("\nWelcome to Sea Scapes! You have been tasked with traveling and mapping the seven seas, but you're being targeted by a group of bandits!");
    puts("You will be presented with several options on your turn, and it will be up to you to decide which the best action is to take.");
    puts("Each available action will have a brief description to aid you in decision making.");
    puts("Once you have taken your turn, the bandits will have an opprotunity to make a move. Fair is fair...\n");

    while (play == 1) //This while loop handles the print statements for losing and winning and for calling the playAgain function
    {
        int winOrLose = menu(); //This calls menu and starts the game, and the outcome will determine whether you lose or win

        if(winOrLose == 1)
        {
            puts("You defeated the bandits and won! Well done!\n");
        }
        else
        {
            puts("Oh no! You've been defeated, now you must make cheese for the bandits every day for the rest of your life! Oh well, at least they have life insurance.\n");
        }

        play = playAgain();
    }

    return 0;
}

int playAgain()
{
    int choice; //The users decision for whether or not to play again

    puts("Would you like to play again?");
    puts("1. Yes please!");
    puts("2. No, I have to use the bathroom...");
    scanf("%i", &choice);

    if (choice != 1)
    {
        puts("Thanks for playing Sea Scapes, hope the bathroom trip goes well!");
        return 0; //Changes winOrLose in main to 0 which stops the flow of the program and ends it
    }
    else
    {
        return 1; //In main, causes winOrLose to stay as 1 and as such repeat the game
    }
}

int menu()
{
    char plrAction;
    int hlthPacks = 5;
    int plrHlth = 100;
    int enemyHlth = 80;
    int chargeUp = 0;


    while (plrHlth > 0 && enemyHlth > 0) //Will only be processed if neither player or enemy are at 0 health, aka if they are still alive
    {
        printf("It is your turn!\nYour current health is %i | The bandits health is %i | You have %i remaining health packs.\n\n", plrHlth, enemyHlth, hlthPacks);
        puts("Choose one of the following actions by selecting its letter.");
        puts("A. Attack");
        puts("H. Heal");
        puts("C. Charge Up (Charge Up will cause your next attack to deal more damage)");
        scanf(" %c", &plrAction); //Player action for their turn


        if (plrAction == 'A' || plrAction == 'a')
        {
            int damage = dealDmg(10, 5); //Calculates damage between 5 and 15 to be dealt to the enemy, and if chargeUp is more than 0, it adds 5 damage to the damage dealt

            if (chargeUp > 0)
                {
                    damage = damage + 5; //Adds the chargeUp bonus
                    chargeUp = 0;
                }

            enemyHlth = enemyHlth - damage;
            printf("You dealt %i damage to the bandits!\n\n", damage);
        }
        else if (plrAction == 'H' || plrAction == 'h')
        {
            if(hlthPacks > 0) //This makes sure that the player cannot heal more than the health packs that they have
            {
                int healing = healDmg(10, 5); //Calculates healing between 5 and 15 to be dealt to the player, IF they still have health packs remaining
                plrHlth = plrHlth + healing;
                hlthPacks = hlthPacks - 1; //Reduces the players number of health packs
                printf("You gainded %i health!\n\n", healing);
            }
            else
            {
                printf("You don't have any more health packs!\n\n");
            }
        }
        else if (plrAction == 'C' || plrAction == 'c')
        {
            chargeUp = chargeUp + 1; //The attack action will look at this variable and if it is
            puts("Your next attack is charged!\n");
        }




        if(enemyHlth <= 0)
        {
            double finalScore = plrHlth / 10.5; //This calculates the players score based on their remaining health, so at to insentivize them to have as much health as possible and to defeat the bandits as quickly as possible
            printf("Your final score is %.2f\n", finalScore);
            return 1; //Returns back to main and sets winOrLose to 1
        }



        int enemyChoice = enemyTurn(); //Calculates what the enemy will do on their turn

        if (enemyChoice == 1)
        {
            int damage = dealDmg(10, 1); //The enemy will always do less damage to the player on average than the player will do to the enemy
            plrHlth = plrHlth - damage;
            printf("The bandits have damaged your ship for %i damage!\n\n", damage);
        }
        else
        {
            int healing = healDmg(5, 1); //The enemy will also heal less on average
            enemyHlth = enemyHlth + healing;
            printf("The bandits have repaired their ship for %i healt!\n\n", healing);
        }

    }


    double finalScore = plrHlth / 10.5; //Calculates the players score if they lose
    printf("Your final score is %.2f\n", finalScore);

    if (enemyHlth <= 0)
    {
        return 1;
    }

    return 0;

}

int dealDmg(int range, int start)
{
    int x = rand();
    int y = x % range + start;

    return y; //Returns the random amount of damage using the range and start parameters given when the function is called
}

int healDmg(int range, int start)
{
    int x = rand();
    int y = x % range + start;

    return y; //Returns the random amount of healing using the range and start parameters given when the function is called
}

int enemyTurn()
{
    int enemyChoice = rand() % 2 + 1;

    return enemyChoice; //Calculates the action for the enemy on their turn
}
