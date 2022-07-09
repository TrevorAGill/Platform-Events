public class ShakeItAllAboutQueueable implements Queueable {
    public void execute(QueueableContext context) {
        System.debug('\nYou put your right foot in \nYou put your right foot out \nYou put your right foot in \nAnd you shake it all about...');
    }
}
