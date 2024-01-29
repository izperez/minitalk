/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: izperez <izperez@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/11 12:39:43 by izperez           #+#    #+#             */
/*   Updated: 2024/01/24 11:31:32 by izperez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	binary_to_text(int signum)
{
	static int	byte;
	static int	i;

	if (signum == SIGUSR1)
		byte |= (0x01 << i);
	i++;
	if (i == 8)
	{
		ft_printf("%c", byte);
		i = 0;
		byte = 0;
	}
}

int	main(void)
{
	ft_printf("Server PID: %d\n", getpid());
	while (1)
	{
		signal(SIGUSR1, binary_to_text);
		signal(SIGUSR2, binary_to_text);
		pause();
	}
	return (0);
}
