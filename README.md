# mitm_tuning
Réglage du noyau pour les attaques MITM

# Description

Lors de la réalisation d'attaques MITM, votre hôte doit être prêt à gérer de gros volumes de trafic. 
Vous pouvez personnaliser légèrement le noyau Linux pour gérer ce trafic de manière optimale.

- fs.file-max=100000: définit le nombre maximal de descripteurs de fichiers qui peuvent être ouverts simultanément. L'augmentation de la valeur permet d'éviter les problèmes de pénurie de descripteurs lors de la gestion d'un grand nombre de connexions. Cela sera utile lorsqu'un hôte gère de nombreuses connexions en même temps, il a besoin de plusieurs descripteurs de fichiers pour chaque connexion. L'augmentation de cette valeur vous permet de conserver davantage de connexions ouvertes sans erreur de dépassement de descripteur ;

- net.core.somaxconn=65535:  définit le nombre maximal de connexions pouvant attendre d'être traitées dans la file d'attente des connexions. Ceci est utile pour les applications à forte charge telles que les serveurs qui acceptent de nombreuses connexions entrantes. L'augmentation de cette valeur permet d'éviter que de nouvelles connexions ne soient abandonnées en raison d'une file d'attente débordante ;

- net.core.netdev_max_backlog=65536:  définit la taille maximale de la file d'attente pour les périphériques réseau gérant le trafic entrant. L'augmentation de ce paramètre permet aux interfaces réseau de traiter plus efficacement les paquets arrivant à des débits élevés, évitant ainsi la perte de paquets ;

- net.ipv4.tcp_fin_timeout=15:  définit le temps, en secondes, pendant lequel une connexion attend pour se terminer après l'envoi d'un paquet (FIN). La réduction du temps d'attente libère les ressources plus rapidement, ce qui est utile dans les environnements à forte charge, une valeur de 15 secondes étant un compromis entre la libération des ressources et l'évitement des problèmes de réutilisation des ports ;

- net.ipv4.tcp_tw_reuse=1:  permet de réutiliser les sockets dans l'état TIME-WAIT pour de nouvelles connexions. La réutilisation des sockets évite la pénurie de ports en cas de charge élevée car les ports dans l'état TIME-WAIT peuvent être réutilisés ;

- net.ipv4.tcp_tw_recycle=1: active le mode de réutilisation accélérée des sockets dans l'état TIME-WAIT. L'activation de cette option permet au noyau de libérer et de réutiliser les sockets plus rapidement, améliorant ainsi les performances globales dans des conditions de charge élevée ;

- net.ipv4.tcp_max_tw_buckets=65536: définit le nombre maximal de sockets dans l'état TIME-WAIT qui peuvent être mis en file d'attente. L'augmentation de cette valeur empêche les sockets dans l'état TIME-WAIT d'être abandonnés, ce qui peut se produire s'ils arrivent trop rapidement ;

- net.core.rmem_max=16777216 et net.core.wmem_max=16777216:  ces paramètres définissent les tailles maximales de tampon pour les paquets entrants (rmem_max)et sortants (wmem_max). L'augmentation de ces valeurs permet aux interfaces réseau de gérer de plus grandes quantités de données, ce qui est particulièrement important lorsqu'il s'agit de trafic à haut débit ;

- net.core.rmem_default=8388608 et net.core.wmem_default=8388608:  Ces paramètres définissent les valeurs par défaut des tailles de tampon des paquets entrants (wmem_default) et sortants (wmem_default). Ces valeurs définissent les tailles de tampon initiales pour les nouveaux sockets, offrant une capacité suffisante pour gérer le trafic ;

- net.ipv4.tcp_max_syn_backlog=4096: augmente le nombre maximal de requêtes SYN entrantes pouvant attendre un accusé de réception. L'augmentation de cette valeur permet à l'hôte de gérer un plus grand nombre de requêtes de connexion entrantes, ce qui est particulièrement important dans des conditions de charge élevée.

-net.ipv4.tcp_window_scaling=1: Le paramètre de mise à l'échelle de la fenêtre TCP contrôle la mise à l'échelle de la fenêtre TCP. L'augmentation de la taille de la fenêtre TCP peut améliorer les performances de transfert de données dans un réseau à latence élevée ou à charge élevée. Dans TCP, chaque côté définit la taille de la fenêtre. Le nombre approprié d'octets peut être envoyé sans accusé de réception. La mise à l'échelle de la fenêtre permet d'augmenter la taille de cette fenêtre, ce qui est particulièrement utile pour les réseaux à haut débit.

# Script d'installation

