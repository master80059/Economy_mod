﻿namespace Economy.scripts.Messages
{
    using ProtoBuf;
    using System.Linq;

    public class MessageConnectionRequest : MessageBase
    {
        [ProtoMember(1)]
        public int ModCommunicationVersion;

        public override void ProcessClient()
        {
            // never processed on client
        }

        public override void ProcessServer()
        {
            EconomyScript.Instance.ServerLogger.Write("Player '{0}' connected", SenderDisplayName);

            if (ModCommunicationVersion != EconomyConsts.ModCommunicationVersion)
            {
                // TODO: respond to the potentional communication conflict.
                // Could Client be older than Server?
                // It's possible, if the Client has trouble downloading from Steam Community which can happen on occasion.
            }

            // Is Server version older than what Client is running, or Server version is newer than Client.
            MessageConnectionResponse.SendMessage(SenderSteamId, 
                ModCommunicationVersion < EconomyConsts.ModCommunicationVersion, ModCommunicationVersion > EconomyConsts.ModCommunicationVersion);

            var account = EconomyScript.Instance.BankConfigData.Accounts.FirstOrDefault(
                a => a.SteamId == SenderSteamId);

            // Create the Bank Account when the player first joins.
            if (account == null)
            {
                EconomyScript.Instance.ServerLogger.Write("Creating new Bank Account for '{0}'", SenderDisplayName);
                account = EconomyScript.Instance.BankConfigData.CreateNewDefaultAccount(SenderSteamId, SenderDisplayName);
                EconomyScript.Instance.BankConfigData.Accounts.Add(account);
            }
            else
            {
                EconomyScript.Instance.BankConfigData.UpdateLastSeen(SenderSteamId, SenderDisplayName);
            }
        }

        public static void SendMessage(int modCommunicationVersion)
        {
            ConnectionHelper.SendMessageToServer(new MessageConnectionRequest { ModCommunicationVersion = modCommunicationVersion });
        }
    }
}
