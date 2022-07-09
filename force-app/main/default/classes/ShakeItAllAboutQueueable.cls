public class DoTheHokeyPokeyQueueable implements Queueable {
    public void execute(QueueableContext context) {
        System.debug('You put your right foot in \n You put your right foot out \n You put your right foot in \n And you shake it all about');
    }
}
